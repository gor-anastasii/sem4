namespace Laba2
{
    partial class Form1
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.computer_type = new System.Windows.Forms.ListBox();
            this.label2 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.RAM_Memory = new System.Windows.Forms.ComboBox();
            this.GB_RAM = new System.Windows.Forms.RadioButton();
            this.MB_RAM = new System.Windows.Forms.RadioButton();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.HD_Memory = new System.Windows.Forms.ComboBox();
            this.GB_HD = new System.Windows.Forms.RadioButton();
            this.MB_HD = new System.Windows.Forms.RadioButton();
            this.dateTimePicker1 = new System.Windows.Forms.DateTimePicker();
            this.label3 = new System.Windows.Forms.Label();
            this.domainUpDown1 = new System.Windows.Forms.DomainUpDown();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.domainUpDown2 = new System.Windows.Forms.DomainUpDown();
            this.AddTo = new System.Windows.Forms.Button();
            this.Lab_Items = new System.Windows.Forms.Button();
            this.processor = new System.Windows.Forms.Button();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.videocard_type = new System.Windows.Forms.ListBox();
            this.getCost = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.groupBox5.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft YaHei UI", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(140, 26);
            this.label1.TabIndex = 0;
            this.label1.Text = "IT Laboratory";
            // 
            // computer_type
            // 
            this.computer_type.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.computer_type.Cursor = System.Windows.Forms.Cursors.Default;
            this.computer_type.Font = new System.Drawing.Font("Microsoft YaHei UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.computer_type.FormattingEnabled = true;
            this.computer_type.ItemHeight = 19;
            this.computer_type.Items.AddRange(new object[] {
            "Сервер",
            "Рабочая станция",
            "Ноутбук"});
            this.computer_type.Location = new System.Drawing.Point(12, 65);
            this.computer_type.Name = "computer_type";
            this.computer_type.Size = new System.Drawing.Size(164, 21);
            this.computer_type.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft YaHei UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label2.Location = new System.Drawing.Point(9, 46);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(98, 16);
            this.label2.TabIndex = 2;
            this.label2.Text = "Тип компьютера";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.RAM_Memory);
            this.groupBox1.Controls.Add(this.GB_RAM);
            this.groupBox1.Controls.Add(this.MB_RAM);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft YaHei UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.groupBox1.Location = new System.Drawing.Point(12, 102);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(164, 100);
            this.groupBox1.TabIndex = 3;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Размер ОЗУ";
            // 
            // RAM_Memory
            // 
            this.RAM_Memory.FormattingEnabled = true;
            this.RAM_Memory.Location = new System.Drawing.Point(16, 57);
            this.RAM_Memory.Name = "RAM_Memory";
            this.RAM_Memory.Size = new System.Drawing.Size(137, 24);
            this.RAM_Memory.TabIndex = 2;
            // 
            // GB_RAM
            // 
            this.GB_RAM.AutoSize = true;
            this.GB_RAM.Font = new System.Drawing.Font("Microsoft YaHei UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.GB_RAM.Location = new System.Drawing.Point(95, 28);
            this.GB_RAM.Name = "GB_RAM";
            this.GB_RAM.Size = new System.Drawing.Size(45, 23);
            this.GB_RAM.TabIndex = 1;
            this.GB_RAM.TabStop = true;
            this.GB_RAM.Text = "GB";
            this.GB_RAM.UseVisualStyleBackColor = true;
            this.GB_RAM.CheckedChanged += new System.EventHandler(this.GB_RAM_CheckedChanged);
            // 
            // MB_RAM
            // 
            this.MB_RAM.AutoSize = true;
            this.MB_RAM.Font = new System.Drawing.Font("Microsoft YaHei UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.MB_RAM.Location = new System.Drawing.Point(26, 28);
            this.MB_RAM.Name = "MB_RAM";
            this.MB_RAM.Size = new System.Drawing.Size(48, 23);
            this.MB_RAM.TabIndex = 0;
            this.MB_RAM.TabStop = true;
            this.MB_RAM.Text = "MB";
            this.MB_RAM.UseVisualStyleBackColor = true;
            this.MB_RAM.CheckedChanged += new System.EventHandler(this.MB_RAM_CheckedChanged);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.HD_Memory);
            this.groupBox2.Controls.Add(this.GB_HD);
            this.groupBox2.Controls.Add(this.MB_HD);
            this.groupBox2.Font = new System.Drawing.Font("Microsoft YaHei UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.groupBox2.Location = new System.Drawing.Point(198, 102);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(164, 100);
            this.groupBox2.TabIndex = 4;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Размер ЖД";
            // 
            // HD_Memory
            // 
            this.HD_Memory.FormattingEnabled = true;
            this.HD_Memory.Location = new System.Drawing.Point(16, 57);
            this.HD_Memory.Name = "HD_Memory";
            this.HD_Memory.Size = new System.Drawing.Size(137, 24);
            this.HD_Memory.TabIndex = 2;
            // 
            // GB_HD
            // 
            this.GB_HD.AutoSize = true;
            this.GB_HD.Font = new System.Drawing.Font("Microsoft YaHei UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.GB_HD.Location = new System.Drawing.Point(99, 28);
            this.GB_HD.Name = "GB_HD";
            this.GB_HD.Size = new System.Drawing.Size(45, 23);
            this.GB_HD.TabIndex = 1;
            this.GB_HD.TabStop = true;
            this.GB_HD.Text = "GB";
            this.GB_HD.UseVisualStyleBackColor = true;
            this.GB_HD.CheckedChanged += new System.EventHandler(this.GB_HD_CheckedChanged);
            // 
            // MB_HD
            // 
            this.MB_HD.AutoSize = true;
            this.MB_HD.Font = new System.Drawing.Font("Microsoft YaHei UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.MB_HD.Location = new System.Drawing.Point(28, 28);
            this.MB_HD.Name = "MB_HD";
            this.MB_HD.Size = new System.Drawing.Size(48, 23);
            this.MB_HD.TabIndex = 0;
            this.MB_HD.TabStop = true;
            this.MB_HD.Text = "MB";
            this.MB_HD.UseVisualStyleBackColor = true;
            this.MB_HD.CheckedChanged += new System.EventHandler(this.MB_HD_CheckedChanged);
            // 
            // dateTimePicker1
            // 
            this.dateTimePicker1.Location = new System.Drawing.Point(198, 65);
            this.dateTimePicker1.Name = "dateTimePicker1";
            this.dateTimePicker1.Size = new System.Drawing.Size(164, 20);
            this.dateTimePicker1.TabIndex = 5;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft YaHei UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label3.Location = new System.Drawing.Point(195, 46);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(115, 16);
            this.label3.TabIndex = 6;
            this.label3.Text = "Дата приобритения";
            // 
            // domainUpDown1
            // 
            this.domainUpDown1.Items.Add("SRAM");
            this.domainUpDown1.Items.Add("DRAM");
            this.domainUpDown1.Items.Add("SDRAM");
            this.domainUpDown1.Location = new System.Drawing.Point(16, 29);
            this.domainUpDown1.Name = "domainUpDown1";
            this.domainUpDown1.Size = new System.Drawing.Size(137, 21);
            this.domainUpDown1.TabIndex = 7;
            this.domainUpDown1.Text = "SRAM";
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.domainUpDown1);
            this.groupBox3.Font = new System.Drawing.Font("Microsoft YaHei UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.groupBox3.Location = new System.Drawing.Point(12, 209);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(164, 72);
            this.groupBox3.TabIndex = 8;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Тип ОЗУ";
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.domainUpDown2);
            this.groupBox4.Font = new System.Drawing.Font("Microsoft YaHei UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.groupBox4.Location = new System.Drawing.Point(198, 209);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(164, 72);
            this.groupBox4.TabIndex = 9;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Тип ЖД";
            // 
            // domainUpDown2
            // 
            this.domainUpDown2.Items.Add("SSD");
            this.domainUpDown2.Items.Add("HDD");
            this.domainUpDown2.Location = new System.Drawing.Point(16, 29);
            this.domainUpDown2.Name = "domainUpDown2";
            this.domainUpDown2.Size = new System.Drawing.Size(137, 21);
            this.domainUpDown2.TabIndex = 7;
            this.domainUpDown2.Text = "SSD";
            // 
            // AddTo
            // 
            this.AddTo.Font = new System.Drawing.Font("Microsoft YaHei UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.AddTo.Location = new System.Drawing.Point(12, 365);
            this.AddTo.Name = "AddTo";
            this.AddTo.Size = new System.Drawing.Size(164, 44);
            this.AddTo.TabIndex = 10;
            this.AddTo.Text = "Добавить в лабораторию";
            this.AddTo.UseVisualStyleBackColor = true;
            this.AddTo.Click += new System.EventHandler(this.AddTo_Click);
            // 
            // Lab_Items
            // 
            this.Lab_Items.Font = new System.Drawing.Font("Microsoft YaHei UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.Lab_Items.Location = new System.Drawing.Point(198, 365);
            this.Lab_Items.Name = "Lab_Items";
            this.Lab_Items.Size = new System.Drawing.Size(164, 44);
            this.Lab_Items.TabIndex = 11;
            this.Lab_Items.Text = "Состав лаборатории";
            this.Lab_Items.UseVisualStyleBackColor = true;
            this.Lab_Items.Click += new System.EventHandler(this.Lab_Items_Click);
            // 
            // processor
            // 
            this.processor.Font = new System.Drawing.Font("Microsoft YaHei UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.processor.Location = new System.Drawing.Point(12, 287);
            this.processor.Name = "processor";
            this.processor.Size = new System.Drawing.Size(164, 72);
            this.processor.TabIndex = 12;
            this.processor.Text = "Процессор";
            this.processor.UseVisualStyleBackColor = true;
            this.processor.Click += new System.EventHandler(this.button3_Click);
            // 
            // groupBox5
            // 
            this.groupBox5.Controls.Add(this.videocard_type);
            this.groupBox5.Font = new System.Drawing.Font("Microsoft YaHei UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.groupBox5.Location = new System.Drawing.Point(198, 287);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(164, 72);
            this.groupBox5.TabIndex = 10;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "Тип ЖД";
            // 
            // videocard_type
            // 
            this.videocard_type.FormattingEnabled = true;
            this.videocard_type.ItemHeight = 16;
            this.videocard_type.Items.AddRange(new object[] {
            "NVIDIA",
            "AMD"});
            this.videocard_type.Location = new System.Drawing.Point(16, 20);
            this.videocard_type.Name = "videocard_type";
            this.videocard_type.Size = new System.Drawing.Size(137, 36);
            this.videocard_type.TabIndex = 0;
            // 
            // getCost
            // 
            this.getCost.Font = new System.Drawing.Font("Microsoft YaHei UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.getCost.Location = new System.Drawing.Point(12, 415);
            this.getCost.Name = "getCost";
            this.getCost.Size = new System.Drawing.Size(350, 36);
            this.getCost.TabIndex = 14;
            this.getCost.Text = "Рассчитать стоимость лаборатории";
            this.getCost.UseVisualStyleBackColor = true;
            this.getCost.Click += new System.EventHandler(this.getCost_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(389, 463);
            this.Controls.Add(this.getCost);
            this.Controls.Add(this.groupBox5);
            this.Controls.Add(this.processor);
            this.Controls.Add(this.Lab_Items);
            this.Controls.Add(this.AddTo);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.dateTimePicker1);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.computer_type);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.Text = "IT Laboratory";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox4.ResumeLayout(false);
            this.groupBox5.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ListBox computer_type;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton GB_RAM;
        private System.Windows.Forms.RadioButton MB_RAM;
        private System.Windows.Forms.ComboBox RAM_Memory;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.ComboBox HD_Memory;
        private System.Windows.Forms.RadioButton GB_HD;
        private System.Windows.Forms.RadioButton MB_HD;
        private System.Windows.Forms.DateTimePicker dateTimePicker1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.DomainUpDown domainUpDown1;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.DomainUpDown domainUpDown2;
        private System.Windows.Forms.Button AddTo;
        private System.Windows.Forms.Button Lab_Items;
        private System.Windows.Forms.Button processor;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.ListBox videocard_type;
        private System.Windows.Forms.Button getCost;
    }
}

