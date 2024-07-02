namespace Laba2
{
    partial class Form2
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
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.CPU_Producer = new System.Windows.Forms.ListBox();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.CPU_Architecture = new System.Windows.Forms.DomainUpDown();
            this.CPU_Series = new System.Windows.Forms.MaskedTextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.CPU_Model = new System.Windows.Forms.MaskedTextBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.CPU_Frequency = new System.Windows.Forms.MaskedTextBox();
            this.groupBox6 = new System.Windows.Forms.GroupBox();
            this.CPU_Max_Frequency = new System.Windows.Forms.MaskedTextBox();
            this.groupBox7 = new System.Windows.Forms.GroupBox();
            this.CPU_core = new System.Windows.Forms.MaskedTextBox();
            this.CPU_btn = new System.Windows.Forms.Button();
            this.groupBox5.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox6.SuspendLayout();
            this.groupBox7.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft YaHei UI", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(237, 26);
            this.label1.TabIndex = 1;
            this.label1.Text = "IT Laboratory Processor";
            // 
            // groupBox5
            // 
            this.groupBox5.Controls.Add(this.CPU_Producer);
            this.groupBox5.Font = new System.Drawing.Font("Microsoft YaHei UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.groupBox5.Location = new System.Drawing.Point(17, 38);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(164, 72);
            this.groupBox5.TabIndex = 11;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "Производитель";
            // 
            // CPU_Producer
            // 
            this.CPU_Producer.FormattingEnabled = true;
            this.CPU_Producer.ItemHeight = 16;
            this.CPU_Producer.Items.AddRange(new object[] {
            "INTEL",
            "AMD"});
            this.CPU_Producer.Location = new System.Drawing.Point(16, 20);
            this.CPU_Producer.Name = "CPU_Producer";
            this.CPU_Producer.Size = new System.Drawing.Size(137, 36);
            this.CPU_Producer.TabIndex = 0;
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.CPU_Architecture);
            this.groupBox4.Font = new System.Drawing.Font("Microsoft YaHei UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.groupBox4.Location = new System.Drawing.Point(17, 116);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(164, 72);
            this.groupBox4.TabIndex = 12;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Тип ЖД";
            // 
            // CPU_Architecture
            // 
            this.CPU_Architecture.Items.Add("x32");
            this.CPU_Architecture.Items.Add("x64");
            this.CPU_Architecture.Location = new System.Drawing.Point(16, 29);
            this.CPU_Architecture.Name = "CPU_Architecture";
            this.CPU_Architecture.Size = new System.Drawing.Size(137, 21);
            this.CPU_Architecture.TabIndex = 7;
            this.CPU_Architecture.Text = "x64";
            // 
            // CPU_Series
            // 
            this.CPU_Series.HidePromptOnLeave = true;
            this.CPU_Series.Location = new System.Drawing.Point(17, 32);
            this.CPU_Series.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.CPU_Series.Mask = "00";
            this.CPU_Series.Name = "CPU_Series";
            this.CPU_Series.Size = new System.Drawing.Size(119, 21);
            this.CPU_Series.TabIndex = 35;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.CPU_Series);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft YaHei UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.groupBox1.Location = new System.Drawing.Point(197, 38);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(164, 72);
            this.groupBox1.TabIndex = 36;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Серия";
            // 
            // CPU_Model
            // 
            this.CPU_Model.HidePromptOnLeave = true;
            this.CPU_Model.Location = new System.Drawing.Point(17, 30);
            this.CPU_Model.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.CPU_Model.Mask = "A000???";
            this.CPU_Model.Name = "CPU_Model";
            this.CPU_Model.Size = new System.Drawing.Size(119, 21);
            this.CPU_Model.TabIndex = 38;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.CPU_Model);
            this.groupBox2.Font = new System.Drawing.Font("Microsoft YaHei UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.groupBox2.Location = new System.Drawing.Point(197, 116);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(164, 72);
            this.groupBox2.TabIndex = 37;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Модель";
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.CPU_Frequency);
            this.groupBox3.Font = new System.Drawing.Font("Microsoft YaHei UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.groupBox3.Location = new System.Drawing.Point(17, 194);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(164, 72);
            this.groupBox3.TabIndex = 38;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Частота (МГц)";
            // 
            // CPU_Frequency
            // 
            this.CPU_Frequency.HidePromptOnLeave = true;
            this.CPU_Frequency.Location = new System.Drawing.Point(17, 30);
            this.CPU_Frequency.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.CPU_Frequency.Mask = "0000";
            this.CPU_Frequency.Name = "CPU_Frequency";
            this.CPU_Frequency.Size = new System.Drawing.Size(119, 21);
            this.CPU_Frequency.TabIndex = 38;
            // 
            // groupBox6
            // 
            this.groupBox6.Controls.Add(this.CPU_Max_Frequency);
            this.groupBox6.Font = new System.Drawing.Font("Microsoft YaHei UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.groupBox6.Location = new System.Drawing.Point(197, 194);
            this.groupBox6.Name = "groupBox6";
            this.groupBox6.Size = new System.Drawing.Size(164, 72);
            this.groupBox6.TabIndex = 39;
            this.groupBox6.TabStop = false;
            this.groupBox6.Text = "Макс. частота (МГц)";
            // 
            // CPU_Max_Frequency
            // 
            this.CPU_Max_Frequency.HidePromptOnLeave = true;
            this.CPU_Max_Frequency.Location = new System.Drawing.Point(17, 30);
            this.CPU_Max_Frequency.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.CPU_Max_Frequency.Mask = "0000";
            this.CPU_Max_Frequency.Name = "CPU_Max_Frequency";
            this.CPU_Max_Frequency.Size = new System.Drawing.Size(119, 21);
            this.CPU_Max_Frequency.TabIndex = 38;
            // 
            // groupBox7
            // 
            this.groupBox7.Controls.Add(this.CPU_core);
            this.groupBox7.Font = new System.Drawing.Font("Microsoft YaHei UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.groupBox7.Location = new System.Drawing.Point(17, 272);
            this.groupBox7.Name = "groupBox7";
            this.groupBox7.Size = new System.Drawing.Size(164, 72);
            this.groupBox7.TabIndex = 40;
            this.groupBox7.TabStop = false;
            this.groupBox7.Text = "Кол-вл ядер";
            // 
            // CPU_core
            // 
            this.CPU_core.HidePromptOnLeave = true;
            this.CPU_core.Location = new System.Drawing.Point(17, 30);
            this.CPU_core.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.CPU_core.Mask = "00";
            this.CPU_core.Name = "CPU_core";
            this.CPU_core.Size = new System.Drawing.Size(119, 21);
            this.CPU_core.TabIndex = 38;
            // 
            // CPU_btn
            // 
            this.CPU_btn.Font = new System.Drawing.Font("Microsoft YaHei UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.CPU_btn.Location = new System.Drawing.Point(197, 279);
            this.CPU_btn.Name = "CPU_btn";
            this.CPU_btn.Size = new System.Drawing.Size(164, 65);
            this.CPU_btn.TabIndex = 41;
            this.CPU_btn.Text = "Подтвердить";
            this.CPU_btn.UseVisualStyleBackColor = true;
            this.CPU_btn.Click += new System.EventHandler(this.CPU_btn_Click);
            // 
            // Form2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(378, 367);
            this.Controls.Add(this.CPU_btn);
            this.Controls.Add(this.groupBox7);
            this.Controls.Add(this.groupBox6);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.groupBox5);
            this.Controls.Add(this.label1);
            this.Name = "Form2";
            this.Text = "IT Laboratory Processor";
            this.groupBox5.ResumeLayout(false);
            this.groupBox4.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.groupBox6.ResumeLayout(false);
            this.groupBox6.PerformLayout();
            this.groupBox7.ResumeLayout(false);
            this.groupBox7.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.ListBox CPU_Producer;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.DomainUpDown CPU_Architecture;
        private System.Windows.Forms.MaskedTextBox CPU_Series;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.MaskedTextBox CPU_Model;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.MaskedTextBox CPU_Frequency;
        private System.Windows.Forms.GroupBox groupBox6;
        private System.Windows.Forms.MaskedTextBox CPU_Max_Frequency;
        private System.Windows.Forms.GroupBox groupBox7;
        private System.Windows.Forms.MaskedTextBox CPU_core;
        private System.Windows.Forms.Button CPU_btn;
    }
}