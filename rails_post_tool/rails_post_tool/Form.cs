using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Runtime.InteropServices;

namespace rails_post_tool
{
    public partial class Form : System.Windows.Forms.Form
    {
        readonly Dictionary<string, Tuple<string, string> > _dicExcel = new Dictionary<string, Tuple<string, string>>();

        readonly Dictionary<string, string> _dicServer = new Dictionary<string, string>();

        private string _destination;

        int _executeCount = 0;
        private readonly object _lockObject = new object();

        public Form()
        {
            InitializeComponent();

            NativeMethods.AllocConsole();
            Console.WriteLine(@"Debug Console");
        }

        ~Form()
        {
            NativeMethods.FreeConsole();
        }

        private void Form_Load(object sender, EventArgs e)
        {
            lock (_lockObject)
            {
                ++_executeCount;
            }
            ExecuteCommandSync("ruby -I ../../../gundam_base/SazabiExcel ../../../gundam_base/SazabiExcel/ExcelReader.rb data/EXCEL_LIST.xlsx EXCEL_LIST INDEX json:file " + AppDomain.CurrentDomain.BaseDirectory + "data");

            lock (_lockObject)
            {
                ++_executeCount;
            }
            ExecuteCommandSync("ruby -I ../../../gundam_base/SazabiExcel ../../../gundam_base/SazabiExcel/ExcelReader.rb data/SERVER_LIST.xlsx SERVER_LIST INDEX json:file " + AppDomain.CurrentDomain.BaseDirectory + "data");

            set_excel_list();

            set_server_list();

        }

        private void set_excel_list()
        {
            var text = System.IO.File.ReadAllText("data/EXCEL_LIST.json");

            var obj = JObject.Parse(text);

            foreach (var x in obj)
            {
                var name = x.Key;
                var value = x.Value;

                var itemObj = value;
                var excel = itemObj[1].ToString().Trim();
                var key = itemObj[2].ToString().Trim();
                add_excel(excel, excel, key);
            }
        }

        public bool add_excel(string file, string excel, string index)
        {
            _dicExcel.Add(excel, Tuple.Create<string, string>(index, file));

            if (true == listbox_excel.Items.Contains(excel))
            {
                MessageBox.Show(@"duplicated excel file. " + excel);
                return false;
            }

            listbox_excel.Items.Add(excel);
            return true;
        }

        private void set_server_list()
        {
            var text = System.IO.File.ReadAllText("data/SERVER_LIST.json");

            var obj = JObject.Parse(text);

            foreach (var x in obj)
            {
                var name = x.Key;
                var value = x.Value;

                var itemObj = value;
                var address = itemObj[2].ToString();
                var server_name = itemObj[3].ToString();
                _dicServer.Add(server_name, address);

                if (true == comboBox_Destination.Items.Contains(server_name))
                {
                    MessageBox.Show("duplicated svr. " + server_name);
                    continue;
                }

                comboBox_Destination.Items.Add(server_name);
            }

            comboBox_Destination.SelectedIndex = 0;
        }

        private void button_none_Click(object sender, EventArgs e)
        {
            for (var i = 0; i < listbox_excel.Items.Count; ++i)
            {
                if (listbox_excel.GetItemChecked(i))
                {
                    listbox_excel.SetItemChecked(i, false);
                }
            }

            checkBox_include_SERVER_LIST.Checked = false;
        }

        private void button_all_Click(object sender, EventArgs e)
        {
            for (var i = 0; i < listbox_excel.Items.Count; ++i)
            {
                listbox_excel.SetItemChecked(i, true);
            }

            checkBox_include_SERVER_LIST.Checked = true;
        }

        private void button_run_Click(object sender, EventArgs e)
        {
            if( false == _dicServer.ContainsKey(_destination))
            {
                MessageBox.Show("invalid destination. " + _destination);
                return;
            }

            var address = _dicServer[_destination];

            for (var i = 0; i < listbox_excel.Items.Count; ++i)
            {
                if (listbox_excel.GetItemChecked(i))
                {
                    var excel = listbox_excel.Items[i].ToString();
                    if( false == _dicExcel.ContainsKey(excel))
                    {
                        MessageBox.Show("invalid excel name. " + excel);
                        return;
                    }

                    var tuple = _dicExcel[excel];

                    execute_async(tuple.Item2, excel, "../../schema/", tuple.Item1, address);
                }
            }

            if (true == checkBox_include_SERVER_LIST.Checked)
            {
                execute_async("SERVER_LIST_" + _destination, "SERVER_LIST", "./data/", "INDEX", address);
            }

            while(true)
            {
                lock (_lockObject)
                {
                    if(_executeCount <= 0)
                    {
                        break;
                    }
                    Thread.Sleep(1);
                }
            }

            MessageBox.Show(@"Rails Post Completed");

        }

        void execute_async(string file, string excel, string dest, string index, string address)
        {
            lock (_lockObject)
            {
                ++_executeCount;
            }

            var cmd = "ruby -I ../../../gundam_base/SazabiExcel ../../../gundam_base/SazabiExcel/ExcelReader.rb " + dest + file + ".xlsx " + excel + " " + index + " rails_post:" + address;
            ExecuteCommandAsync(cmd);
        }

        private void ExecuteCommandSync(object command)
        {
            try
            {
                Console.WriteLine(@"execute: " + command);

                // create the ProcessStartInfo using "cmd" as the program to be run,
                // and "/c " as the parameters.
                // Incidentally, /c tells cmd that we want it to execute the command that follows,
                // and then exit.
                System.Diagnostics.ProcessStartInfo procStartInfo = new System.Diagnostics.ProcessStartInfo("cmd", "/c " + command);

                // The following commands are needed to redirect the standard output.
                // This means that it will be redirected to the Process.StandardOutput StreamReader.
                procStartInfo.RedirectStandardOutput = true;
                procStartInfo.UseShellExecute = false;
                // Do not create the black window.
                procStartInfo.CreateNoWindow = true;
                // Now we create a process, assign its ProcessStartInfo and start it
                System.Diagnostics.Process proc = new System.Diagnostics.Process {StartInfo = procStartInfo};
                proc.Start();

                while (proc.HasExited)
                {
                    Thread.Sleep(1);
                }

                // Get the output into a string
                var result = proc.StandardOutput.ReadToEnd();

                // Display the command output.
                Console.WriteLine(@"shell execute result : " + result);

                lock (_lockObject)
                {
                    --_executeCount;
                }
            }
            catch (Exception objException)
            {
                // Log the exception
                Console.WriteLine(objException.Message);
            }
        }

        private void ExecuteCommandAsync(string command)
        {
            try
            {
                //Asynchronously start the Thread to process the Execute command request.
                var objThread = new Thread(new ParameterizedThreadStart(ExecuteCommandSync))
                {
                    IsBackground = true,
                    Priority = ThreadPriority.AboveNormal
                };
                //Make the thread as background thread.
                //Set the Priority of the thread.
                //Start the thread.
                objThread.Start(command);
            }
            catch (ThreadStartException objException)
            {
                Console.WriteLine(objException.Message);
            }
            catch (ThreadAbortException objException)
            {
                Console.WriteLine(objException.Message);
            }
            catch (Exception objException)
            {
                Console.WriteLine(objException.Message);
            }
        }

        private void comboBox_Destination_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ( comboBox_Destination.SelectedIndex >= 0)
            {
                this._destination = comboBox_Destination.SelectedItem as string;

                if (false == _dicServer.ContainsKey(_destination))
                {
                    MessageBox.Show(@"invalid destination. " + _destination);
                    return;
                }

                string address = _dicServer[_destination];
                label_address_content.Text = address;
            }
        }
    }

    internal static class NativeMethods
    {
        // http://msdn.microsoft.com/en-us/library/ms681944(VS.85).aspx
        /// <summary>
        /// Allocates a new console for the calling process.
        /// </summary>
        /// <returns>nonzero if the function succeeds; otherwise, zero.</returns>
        /// <remarks>
        /// A process can be associated with only one console,
        /// so the function fails if the calling process already has a console.
        /// </remarks>
        [DllImport("kernel32.dll", SetLastError = true)]
        internal static extern int AllocConsole();

        // http://msdn.microsoft.com/en-us/library/ms683150(VS.85).aspx
        /// <summary>
        /// Detaches the calling process from its console.
        /// </summary>
        /// <returns>nonzero if the function succeeds; otherwise, zero.</returns>
        /// <remarks>
        /// If the calling process is not already attached to a console,
        /// the error code returned is ERROR_INVALID_PARAMETER (87).
        /// </remarks>
        [DllImport("kernel32.dll", SetLastError = true)]
        internal static extern int FreeConsole();
    }

}

