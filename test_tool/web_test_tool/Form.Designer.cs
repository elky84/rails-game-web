﻿namespace web_test_tool
{
    partial class Form
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.listbox_script = new System.Windows.Forms.CheckedListBox();
            this.button_all = new System.Windows.Forms.Button();
            this.button_none = new System.Windows.Forms.Button();
            this.button_run = new System.Windows.Forms.Button();
            this.comboBox_Destination = new System.Windows.Forms.ComboBox();
            this.label_server = new System.Windows.Forms.Label();
            this.label_address_tag = new System.Windows.Forms.Label();
            this.label_address_content = new System.Windows.Forms.Label();
            this.label_count = new System.Windows.Forms.Label();
            this.textBox_count = new System.Windows.Forms.TextBox();
            this.textBox_seq = new System.Windows.Forms.TextBox();
            this.label_seq = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // listbox_script
            // 
            this.listbox_script.FormattingEnabled = true;
            this.listbox_script.Location = new System.Drawing.Point(12, 39);
            this.listbox_script.Name = "listbox_script";
            this.listbox_script.Size = new System.Drawing.Size(507, 292);
            this.listbox_script.TabIndex = 0;
            // 
            // button_all
            // 
            this.button_all.Location = new System.Drawing.Point(437, 12);
            this.button_all.Name = "button_all";
            this.button_all.Size = new System.Drawing.Size(81, 21);
            this.button_all.TabIndex = 1;
            this.button_all.Text = "all";
            this.button_all.UseVisualStyleBackColor = true;
            this.button_all.Click += new System.EventHandler(this.button_all_Click);
            // 
            // button_none
            // 
            this.button_none.Location = new System.Drawing.Point(350, 12);
            this.button_none.Name = "button_none";
            this.button_none.Size = new System.Drawing.Size(81, 21);
            this.button_none.TabIndex = 2;
            this.button_none.Text = "none";
            this.button_none.UseVisualStyleBackColor = true;
            this.button_none.Click += new System.EventHandler(this.button_none_Click);
            // 
            // button_run
            // 
            this.button_run.Location = new System.Drawing.Point(437, 337);
            this.button_run.Name = "button_run";
            this.button_run.Size = new System.Drawing.Size(82, 22);
            this.button_run.TabIndex = 4;
            this.button_run.Text = "run";
            this.button_run.UseVisualStyleBackColor = true;
            this.button_run.Click += new System.EventHandler(this.button_run_Click);
            // 
            // comboBox_Destination
            // 
            this.comboBox_Destination.FormattingEnabled = true;
            this.comboBox_Destination.Location = new System.Drawing.Point(60, 337);
            this.comboBox_Destination.Name = "comboBox_Destination";
            this.comboBox_Destination.Size = new System.Drawing.Size(121, 20);
            this.comboBox_Destination.TabIndex = 5;
            this.comboBox_Destination.SelectedIndexChanged += new System.EventHandler(this.comboBox_Destination_SelectedIndexChanged);
            // 
            // label_server
            // 
            this.label_server.AutoSize = true;
            this.label_server.Location = new System.Drawing.Point(13, 340);
            this.label_server.Name = "label_server";
            this.label_server.Size = new System.Drawing.Size(41, 12);
            this.label_server.TabIndex = 6;
            this.label_server.Text = "Server";
            // 
            // label_address_tag
            // 
            this.label_address_tag.AutoSize = true;
            this.label_address_tag.Location = new System.Drawing.Point(187, 342);
            this.label_address_tag.Name = "label_address_tag";
            this.label_address_tag.Size = new System.Drawing.Size(52, 12);
            this.label_address_tag.TabIndex = 7;
            this.label_address_tag.Text = "Address";
            // 
            // label_address_content
            // 
            this.label_address_content.AutoSize = true;
            this.label_address_content.Location = new System.Drawing.Point(245, 342);
            this.label_address_content.Name = "label_address_content";
            this.label_address_content.Size = new System.Drawing.Size(0, 12);
            this.label_address_content.TabIndex = 8;
            // 
            // label_count
            // 
            this.label_count.AutoSize = true;
            this.label_count.Location = new System.Drawing.Point(193, 16);
            this.label_count.Name = "label_count";
            this.label_count.Size = new System.Drawing.Size(38, 12);
            this.label_count.TabIndex = 9;
            this.label_count.Text = "Count";
            // 
            // textBox_count
            // 
            this.textBox_count.Location = new System.Drawing.Point(244, 10);
            this.textBox_count.Name = "textBox_count";
            this.textBox_count.Size = new System.Drawing.Size(100, 21);
            this.textBox_count.TabIndex = 10;
            // 
            // textBox_seq
            // 
            this.textBox_seq.Location = new System.Drawing.Point(87, 10);
            this.textBox_seq.Name = "textBox_seq";
            this.textBox_seq.Size = new System.Drawing.Size(100, 21);
            this.textBox_seq.TabIndex = 12;
            // 
            // label_seq
            // 
            this.label_seq.AutoSize = true;
            this.label_seq.Location = new System.Drawing.Point(36, 16);
            this.label_seq.Name = "label_seq";
            this.label_seq.Size = new System.Drawing.Size(27, 12);
            this.label_seq.TabIndex = 11;
            this.label_seq.Text = "Seq";
            // 
            // Form
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(526, 365);
            this.Controls.Add(this.textBox_seq);
            this.Controls.Add(this.label_seq);
            this.Controls.Add(this.textBox_count);
            this.Controls.Add(this.label_count);
            this.Controls.Add(this.label_address_content);
            this.Controls.Add(this.label_address_tag);
            this.Controls.Add(this.label_server);
            this.Controls.Add(this.comboBox_Destination);
            this.Controls.Add(this.button_run);
            this.Controls.Add(this.button_none);
            this.Controls.Add(this.button_all);
            this.Controls.Add(this.listbox_script);
            this.Name = "Form";
            this.Text = "web_test_tool";
            this.Load += new System.EventHandler(this.Form_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.CheckedListBox listbox_script;
        private System.Windows.Forms.Button button_all;
        private System.Windows.Forms.Button button_none;
        private System.Windows.Forms.Button button_run;
        private System.Windows.Forms.ComboBox comboBox_Destination;
        private System.Windows.Forms.Label label_server;
        private System.Windows.Forms.Label label_address_tag;
        private System.Windows.Forms.Label label_address_content;
        private System.Windows.Forms.Label label_count;
        private System.Windows.Forms.TextBox textBox_count;
        private System.Windows.Forms.TextBox textBox_seq;
        private System.Windows.Forms.Label label_seq;
    }
}

