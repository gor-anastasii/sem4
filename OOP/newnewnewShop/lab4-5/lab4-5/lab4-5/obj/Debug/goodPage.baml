   M S B A M L   `   `   `  ����O  Kmscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e0891&clr-namespace:System;assembly=mscorlibSystem  5   	   A =lab4-5, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:lab4_5lab4_5 5   	      lab4_5.goodPage   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   3system&clr-namespace:System;assembly=mscorlib  5   	    localclr-namespace:lab4_5  5   	     � 
ResizeMode$  NoResize=�6-    � WindowStartupLocation$ CenterScreen=�5	       � WindowStyle$
 None=�6?    � Title$ goodPage��5
   	   $	��600��6   $	��400��6'    J� CommandBindings 5      )  #System.Windows.Input.CommandBinding  5   
   -   5           Command$  local:Command.CloseCommand��5      6Q     5   
   -   5        $ local:Command.AddCommand��5      6T     5   
   -   5        $# local:Command.AddImageCommand��5      6W     5   
   -   5        $! local:Command.UpdateCommand��5      6Y   .��5      �� 
����d�$��2q�6*      PrimaryHueMidBrush#��[  6>   ._�5   
   �  � ColumnDefinitions 5      �� 5      $
��0.5* �6#   �� 5      $
��0.5* �6#    � RowDefinitions 5      �� 5      $
��0.2* �6    �� 5      $
��0.2* �6    �� 5      $
��0.2* �6    �� 5      $
��0.2* �6    �� 5      $
��0.2* �6    �� 5      $
��0.2* �6    �� 5       $
��0.2* �6    �� 5!      $
��0.2* �6    .+�5$      �� $ ��local:Command.CloseCommand��6    # MaterialDesignFlatLightBgButton#��[ 5%      $��1��5&      $��2q�6!   $��50��5'      $��50��6    
�������$��0q�6A   $	��Top=�5(      $��Right=�6)   .��5*      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Close=�6*   
���   �67   5+      �� 5,      -   5        	 ��Name$	 image��5,      $��0��6'   $��3��64   $��0��6E   $	��150��6U   $	��180��6a   $��10q�6n   
����d�
 �� StrokeDashArray$
 4R�5-   )   5.      �� 5/      $#��local:Command.AddImageCommand��6    J� Opacity$ 1Q�6>     AddImage#���  6J   $��0��50      $��1��6"   $	��160��62   $��Bottom=�6A   $��0 0 30 0q�6\   6p   �� 51      -   5         ��Name$ 	nameField��51      $��1��52      $��1��6     MaterialDesignTextBox#��[ 53      $��Center=�54      $
��Left=�55      $��14(�56      
�������.  (MaterialDesignThemes.Wpf.TextFieldAssist   HasClearButton . $��180px��58   F   $��180px��6W   $��27��6h   .��6u   )  #MaterialDesignThemes.Wpf.HintAssist   Hint 59      �� 5:        BookName#���  6    .��5;   2   5<      �� 5=      -   5        $ authorField��5=      $��2��5>      $��1��6   #��[ 5?      $��Center=�5@      $
��Left=�5A      $��14(�5B      
������� . $��180px��5D   F   $��180px��6W   $��27��6h   .��6u    5E      �� 5F       
 Author#���  6    .��5G   2   5H      �� 5I      -   5        $ descriptionField��5I      $��6��5J      $��0��6   $��2��6.   #��[ 5K      $��Center=�5L      $
��Left=�5M      $��14(�5N       �� TextWrapping$
 Wrap=�6   
������� . $��	20 0 15 0q�5P   F   $	��345��6Y   $��50��6h   .��6u    5Q      �� 5R        Description#���  6    .��5S   2   5T      �� 5U      -	   5        $ 
priceField��5U      $��3��5V      $��1��6   #��[ 5W      $��Center=�5X      $
��Left=�5Y      $��14(�5Z      
������� . $��180px��5\   G   $��180px��6X   $��27��6i   .��6v    5]      �� 5^       	 Price#���  6    .��5_   2   5`      �� 5a      -
   5         ��Name$ 	BookGenre��5c      $��4��5a      $��2��6#   $
��left=�64   $	��300��6O    1 -MaterialDesignChoiceChipPrimaryOutlineListBox#��[ 5b      $��10q�5c   $   $��2��60   .@�5d      �� -   5         ��Name$ type1��5d       	 	Fantastic#��� 	 5e      �� 5f      -   5        $ type2��5f       
 	Adventure#��� 
 5g      �� 5h      -   5        $ type3��5h       
 Mystic#���  5i      �� 5j      -   5        $ type4��5j        Sсience#���  5k      �� 5l      -   5        $ type5��5l        
Psychology#���  5m      5n      �� 5o      -   5         ��Name$ categoryField��5o       �� SelectedValuePath$
 Text��6.   $��5��5p      $��0��6   $��20 30 15 10q�6.   
���   �  Category �� Text# �  6V    �� 
IsEditable .  �� 
IsReadOnly . .@�5q      ��   ArtisticGenre#��[ 6   �� 5r        EducationalGenre#��[ 6   �� 5s        ChildrenGenre#��[ 6   �� 5t        BusinessGenre#��[ 6   5u      �� 5v      -   5        $ ratingField��5v      $��3��5w      $��0��6   #��[ 5x      $��Center=�5y      $
��Left=�5z      $��14(�5{      
������� . $��15q�5}   F   $��170px��6R   $��170px��6c   $��27��6t   .��6�    5~      �� 5       
 Rating#���  6    .��5�   2   5�      �� 5�      -   5         ��Name$ EditBtn��5�      $!��local:Command.UpdateCommand��6&   $ 1Q�6L   $��7��5�      $��2��6   $��20q�62     Edit#���  6>   6a   �� 5�      -   5        $ AddBtn��5�      $��local:Command.AddCommand��6%   $y�	Collapsed=�6H   $��7��5�      $��2��6   $��20q�62     Add#���  6>   6`   5�      5�      5�      