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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
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
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.toolStripDropDownButton1 = new System.Windows.Forms.ToolStripDropDownButton();
            this.поПроизводителюToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.поМоделиПроцессораToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripDropDownButton2 = new System.Windows.Forms.ToolStripDropDownButton();
            this.поЧастотеToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.поРазмеруОЗУToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripButton1 = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator3 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripButton2 = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator4 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripButton3 = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator5 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripButton4 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton5 = new System.Windows.Forms.ToolStripButton();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.поискToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.сортировкаToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.сохранитьToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.оПрограммеToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.панельИнструментовToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.toolStripStatusLabel1 = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLabel2 = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLabel3 = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLabel4 = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLabel5 = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLabel6 = new System.Windows.Forms.ToolStripStatusLabel();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.поЧастотеToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.поРазмеруОЗУToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.поПроизводителюToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.поМоделиToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.groupBox5.SuspendLayout();
            this.toolStrip1.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            this.statusStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft YaHei UI", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label1.Location = new System.Drawing.Point(29, 58);
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
            this.computer_type.Location = new System.Drawing.Point(29, 114);
            this.computer_type.Name = "computer_type";
            this.computer_type.Size = new System.Drawing.Size(164, 21);
            this.computer_type.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft YaHei UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label2.Location = new System.Drawing.Point(26, 95);
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
            this.groupBox1.Location = new System.Drawing.Point(29, 151);
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
            this.groupBox2.Location = new System.Drawing.Point(215, 151);
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
            this.dateTimePicker1.Location = new System.Drawing.Point(215, 114);
            this.dateTimePicker1.Name = "dateTimePicker1";
            this.dateTimePicker1.Size = new System.Drawing.Size(164, 20);
            this.dateTimePicker1.TabIndex = 5;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft YaHei UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label3.Location = new System.Drawing.Point(212, 95);
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
            this.groupBox3.Location = new System.Drawing.Point(385, 101);
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
            this.groupBox4.Location = new System.Drawing.Point(571, 101);
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
            this.AddTo.Location = new System.Drawing.Point(29, 257);
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
            this.Lab_Items.Location = new System.Drawing.Point(215, 257);
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
            this.processor.Location = new System.Drawing.Point(385, 179);
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
            this.groupBox5.Location = new System.Drawing.Point(571, 179);
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
            this.getCost.Location = new System.Drawing.Point(385, 261);
            this.getCost.Name = "getCost";
            this.getCost.Size = new System.Drawing.Size(350, 40);
            this.getCost.TabIndex = 14;
            this.getCost.Text = "Рассчитать стоимость лаборатории";
            this.getCost.UseVisualStyleBackColor = true;
            this.getCost.Click += new System.EventHandler(this.getCost_Click);
            // 
            // toolStrip1
            // 
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripDropDownButton1,
            this.toolStripSeparator1,
            this.toolStripDropDownButton2,
            this.toolStripSeparator2,
            this.toolStripButton1,
            this.toolStripSeparator3,
            this.toolStripButton2,
            this.toolStripSeparator4,
            this.toolStripButton3,
            this.toolStripSeparator5,
            this.toolStripButton4,
            this.toolStripButton5});
            this.toolStrip1.Location = new System.Drawing.Point(0, 24);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(777, 25);
            this.toolStrip1.TabIndex = 15;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // toolStripDropDownButton1
            // 
            this.toolStripDropDownButton1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.поПроизводителюToolStripMenuItem,
            this.поМоделиПроцессораToolStripMenuItem});
            this.toolStripDropDownButton1.Image = ((System.Drawing.Image)(resources.GetObject("toolStripDropDownButton1.Image")));
            this.toolStripDropDownButton1.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripDropDownButton1.Name = "toolStripDropDownButton1";
            this.toolStripDropDownButton1.Size = new System.Drawing.Size(71, 22);
            this.toolStripDropDownButton1.Text = "Поиск";
            // 
            // поПроизводителюToolStripMenuItem
            // 
            this.поПроизводителюToolStripMenuItem.Name = "поПроизводителюToolStripMenuItem";
            this.поПроизводителюToolStripMenuItem.Size = new System.Drawing.Size(204, 22);
            this.поПроизводителюToolStripMenuItem.Text = "По производителю";
            this.поПроизводителюToolStripMenuItem.Click += new System.EventHandler(this.поПроизводителюToolStripMenuItem_Click);
            // 
            // поМоделиПроцессораToolStripMenuItem
            // 
            this.поМоделиПроцессораToolStripMenuItem.Name = "поМоделиПроцессораToolStripMenuItem";
            this.поМоделиПроцессораToolStripMenuItem.Size = new System.Drawing.Size(204, 22);
            this.поМоделиПроцессораToolStripMenuItem.Text = "По модели процессора";
            this.поМоделиПроцессораToolStripMenuItem.Click += new System.EventHandler(this.поМоделиПроцессораToolStripMenuItem_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(6, 25);
            // 
            // toolStripDropDownButton2
            // 
            this.toolStripDropDownButton2.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.поЧастотеToolStripMenuItem,
            this.поРазмеруОЗУToolStripMenuItem});
            this.toolStripDropDownButton2.Image = ((System.Drawing.Image)(resources.GetObject("toolStripDropDownButton2.Image")));
            this.toolStripDropDownButton2.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripDropDownButton2.Name = "toolStripDropDownButton2";
            this.toolStripDropDownButton2.Size = new System.Drawing.Size(102, 22);
            this.toolStripDropDownButton2.Text = "Сортировка";
            // 
            // поЧастотеToolStripMenuItem
            // 
            this.поЧастотеToolStripMenuItem.Name = "поЧастотеToolStripMenuItem";
            this.поЧастотеToolStripMenuItem.Size = new System.Drawing.Size(204, 22);
            this.поЧастотеToolStripMenuItem.Text = "По частоте процессора";
            this.поЧастотеToolStripMenuItem.Click += new System.EventHandler(this.поЧастотеToolStripMenuItem_Click);
            // 
            // поРазмеруОЗУToolStripMenuItem
            // 
            this.поРазмеруОЗУToolStripMenuItem.Name = "поРазмеруОЗУToolStripMenuItem";
            this.поРазмеруОЗУToolStripMenuItem.Size = new System.Drawing.Size(204, 22);
            this.поРазмеруОЗУToolStripMenuItem.Text = "По размеру ОЗУ";
            this.поРазмеруОЗУToolStripMenuItem.Click += new System.EventHandler(this.поРазмеруОЗУToolStripMenuItem_Click);
            // 
            // toolStripSeparator2
            // 
            this.toolStripSeparator2.Name = "toolStripSeparator2";
            this.toolStripSeparator2.Size = new System.Drawing.Size(6, 25);
            // 
            // toolStripButton1
            // 
            this.toolStripButton1.Image = ((System.Drawing.Image)(resources.GetObject("toolStripButton1.Image")));
            this.toolStripButton1.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton1.Name = "toolStripButton1";
            this.toolStripButton1.Size = new System.Drawing.Size(79, 22);
            this.toolStripButton1.Text = "Очистить";
            this.toolStripButton1.Click += new System.EventHandler(this.toolStripButton1_Click);
            // 
            // toolStripSeparator3
            // 
            this.toolStripSeparator3.Name = "toolStripSeparator3";
            this.toolStripSeparator3.Size = new System.Drawing.Size(6, 25);
            // 
            // toolStripButton2
            // 
            this.toolStripButton2.Image = ((System.Drawing.Image)(resources.GetObject("toolStripButton2.Image")));
            this.toolStripButton2.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton2.Name = "toolStripButton2";
            this.toolStripButton2.Size = new System.Drawing.Size(71, 22);
            this.toolStripButton2.Text = "Удалить";
            this.toolStripButton2.Click += new System.EventHandler(this.toolStripButton2_Click);
            // 
            // toolStripSeparator4
            // 
            this.toolStripSeparator4.Name = "toolStripSeparator4";
            this.toolStripSeparator4.Size = new System.Drawing.Size(6, 25);
            // 
            // toolStripButton3
            // 
            this.toolStripButton3.Image = ((System.Drawing.Image)(resources.GetObject("toolStripButton3.Image")));
            this.toolStripButton3.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton3.Name = "toolStripButton3";
            this.toolStripButton3.Size = new System.Drawing.Size(59, 22);
            this.toolStripButton3.Text = "Назад";
            this.toolStripButton3.Click += new System.EventHandler(this.toolStripButton3_Click);
            // 
            // toolStripSeparator5
            // 
            this.toolStripSeparator5.Name = "toolStripSeparator5";
            this.toolStripSeparator5.Size = new System.Drawing.Size(6, 25);
            // 
            // toolStripButton4
            // 
            this.toolStripButton4.Image = ((System.Drawing.Image)(resources.GetObject("toolStripButton4.Image")));
            this.toolStripButton4.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton4.Name = "toolStripButton4";
            this.toolStripButton4.Size = new System.Drawing.Size(66, 22);
            this.toolStripButton4.Text = "Вперед";
            this.toolStripButton4.Click += new System.EventHandler(this.toolStripButton4_Click);
            // 
            // toolStripButton5
            // 
            this.toolStripButton5.Alignment = System.Windows.Forms.ToolStripItemAlignment.Right;
            this.toolStripButton5.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton5.Image = ((System.Drawing.Image)(resources.GetObject("toolStripButton5.Image")));
            this.toolStripButton5.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton5.Name = "toolStripButton5";
            this.toolStripButton5.Size = new System.Drawing.Size(23, 22);
            this.toolStripButton5.Text = "toolStripButton5";
            this.toolStripButton5.Click += new System.EventHandler(this.toolStripButton5_Click);
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.поискToolStripMenuItem,
            this.сортировкаToolStripMenuItem,
            this.сохранитьToolStripMenuItem,
            this.оПрограммеToolStripMenuItem,
            this.панельИнструментовToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(777, 24);
            this.menuStrip1.TabIndex = 16;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // поискToolStripMenuItem
            // 
            this.поискToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.поПроизводителюToolStripMenuItem1,
            this.поМоделиToolStripMenuItem});
            this.поискToolStripMenuItem.Name = "поискToolStripMenuItem";
            this.поискToolStripMenuItem.Size = new System.Drawing.Size(54, 20);
            this.поискToolStripMenuItem.Text = "Поиск";
            // 
            // сортировкаToolStripMenuItem
            // 
            this.сортировкаToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.поЧастотеToolStripMenuItem1,
            this.поРазмеруОЗУToolStripMenuItem1});
            this.сортировкаToolStripMenuItem.Name = "сортировкаToolStripMenuItem";
            this.сортировкаToolStripMenuItem.Size = new System.Drawing.Size(85, 20);
            this.сортировкаToolStripMenuItem.Text = "Сортировка";
            // 
            // сохранитьToolStripMenuItem
            // 
            this.сохранитьToolStripMenuItem.Name = "сохранитьToolStripMenuItem";
            this.сохранитьToolStripMenuItem.Size = new System.Drawing.Size(78, 20);
            this.сохранитьToolStripMenuItem.Text = "Сохранить";
            this.сохранитьToolStripMenuItem.Click += new System.EventHandler(this.сохранитьToolStripMenuItem_Click);
            // 
            // оПрограммеToolStripMenuItem
            // 
            this.оПрограммеToolStripMenuItem.Name = "оПрограммеToolStripMenuItem";
            this.оПрограммеToolStripMenuItem.Size = new System.Drawing.Size(94, 20);
            this.оПрограммеToolStripMenuItem.Text = "О программе";
            this.оПрограммеToolStripMenuItem.Click += new System.EventHandler(this.оПрограммеToolStripMenuItem_Click);
            // 
            // панельИнструментовToolStripMenuItem
            // 
            this.панельИнструментовToolStripMenuItem.Alignment = System.Windows.Forms.ToolStripItemAlignment.Right;
            this.панельИнструментовToolStripMenuItem.Name = "панельИнструментовToolStripMenuItem";
            this.панельИнструментовToolStripMenuItem.Size = new System.Drawing.Size(141, 20);
            this.панельИнструментовToolStripMenuItem.Text = "Панель инструментов";
            this.панельИнструментовToolStripMenuItem.Visible = false;
            this.панельИнструментовToolStripMenuItem.Click += new System.EventHandler(this.панельИнструментовToolStripMenuItem_Click);
            // 
            // statusStrip1
            // 
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripStatusLabel1,
            this.toolStripStatusLabel2,
            this.toolStripStatusLabel3,
            this.toolStripStatusLabel4,
            this.toolStripStatusLabel5,
            this.toolStripStatusLabel6});
            this.statusStrip1.Location = new System.Drawing.Point(0, 315);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(777, 22);
            this.statusStrip1.TabIndex = 17;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // toolStripStatusLabel1
            // 
            this.toolStripStatusLabel1.Name = "toolStripStatusLabel1";
            this.toolStripStatusLabel1.Size = new System.Drawing.Size(106, 17);
            this.toolStripStatusLabel1.Text = "Кол-во объектов: ";
            // 
            // toolStripStatusLabel2
            // 
            this.toolStripStatusLabel2.Name = "toolStripStatusLabel2";
            this.toolStripStatusLabel2.Size = new System.Drawing.Size(0, 17);
            // 
            // toolStripStatusLabel3
            // 
            this.toolStripStatusLabel3.Name = "toolStripStatusLabel3";
            this.toolStripStatusLabel3.Size = new System.Drawing.Size(122, 17);
            this.toolStripStatusLabel3.Text = "Последнее действие:";
            // 
            // toolStripStatusLabel4
            // 
            this.toolStripStatusLabel4.Name = "toolStripStatusLabel4";
            this.toolStripStatusLabel4.Size = new System.Drawing.Size(0, 17);
            // 
            // toolStripStatusLabel5
            // 
            this.toolStripStatusLabel5.Name = "toolStripStatusLabel5";
            this.toolStripStatusLabel5.Size = new System.Drawing.Size(48, 17);
            this.toolStripStatusLabel5.Text = "Время: ";
            // 
            // toolStripStatusLabel6
            // 
            this.toolStripStatusLabel6.Name = "toolStripStatusLabel6";
            this.toolStripStatusLabel6.Size = new System.Drawing.Size(91, 17);
            this.toolStripStatusLabel6.Text = "13.03.2024 11:42";
            // 
            // поЧастотеToolStripMenuItem1
            // 
            this.поЧастотеToolStripMenuItem1.Name = "поЧастотеToolStripMenuItem1";
            this.поЧастотеToolStripMenuItem1.Size = new System.Drawing.Size(204, 22);
            this.поЧастотеToolStripMenuItem1.Text = "По частоте процессора";
            this.поЧастотеToolStripMenuItem1.Click += new System.EventHandler(this.поЧастотеToolStripMenuItem1_Click);
            // 
            // поРазмеруОЗУToolStripMenuItem1
            // 
            this.поРазмеруОЗУToolStripMenuItem1.Name = "поРазмеруОЗУToolStripMenuItem1";
            this.поРазмеруОЗУToolStripMenuItem1.Size = new System.Drawing.Size(204, 22);
            this.поРазмеруОЗУToolStripMenuItem1.Text = "По размеру ОЗУ";
            this.поРазмеруОЗУToolStripMenuItem1.Click += new System.EventHandler(this.поРазмеруОЗУToolStripMenuItem1_Click);
            // 
            // поПроизводителюToolStripMenuItem1
            // 
            this.поПроизводителюToolStripMenuItem1.Name = "поПроизводителюToolStripMenuItem1";
            this.поПроизводителюToolStripMenuItem1.Size = new System.Drawing.Size(204, 22);
            this.поПроизводителюToolStripMenuItem1.Text = "По производителю";
            this.поПроизводителюToolStripMenuItem1.Click += new System.EventHandler(this.поПроизводителюToolStripMenuItem1_Click);
            // 
            // поМоделиToolStripMenuItem
            // 
            this.поМоделиToolStripMenuItem.Name = "поМоделиToolStripMenuItem";
            this.поМоделиToolStripMenuItem.Size = new System.Drawing.Size(204, 22);
            this.поМоделиToolStripMenuItem.Text = "По модели процессора";
            this.поМоделиToolStripMenuItem.Click += new System.EventHandler(this.поМоделиToolStripMenuItem_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(777, 337);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.toolStrip1);
            this.Controls.Add(this.menuStrip1);
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
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "Form1";
            this.Text = "IT Laboratory";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox4.ResumeLayout(false);
            this.groupBox5.ResumeLayout(false);
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
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
        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripDropDownButton toolStripDropDownButton1;
        private System.Windows.Forms.ToolStripMenuItem поПроизводителюToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem поМоделиПроцессораToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripDropDownButton toolStripDropDownButton2;
        private System.Windows.Forms.ToolStripMenuItem поЧастотеToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem поРазмеруОЗУToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator2;
        private System.Windows.Forms.ToolStripButton toolStripButton1;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator3;
        private System.Windows.Forms.ToolStripButton toolStripButton2;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator4;
        private System.Windows.Forms.ToolStripButton toolStripButton3;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator5;
        private System.Windows.Forms.ToolStripButton toolStripButton4;
        private System.Windows.Forms.ToolStripButton toolStripButton5;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem поискToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem сортировкаToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem сохранитьToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem оПрограммеToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem панельИнструментовToolStripMenuItem;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel1;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel2;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel3;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel4;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel5;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel6;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.ToolStripMenuItem поЧастотеToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem поПроизводителюToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem поМоделиToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem поРазмеруОЗУToolStripMenuItem1;
    }
}

