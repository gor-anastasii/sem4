   M S B A M L   `   `   `  ����A  =lab4-5, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:lab4_5lab4_5  5   	       lab4_5.Message   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   b ^MaterialDesignThemes.Wpf, Version=3.2.0.1979, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	    localclr-namespace:lab4_5  5   	     � WindowStartupLocation$  CenterScreen=�5       � Title$ 
MessageBox��5	   	   $	��150��5
   	   $	��250��5   	   $��Center=�5   	   $��Center=�5   	    � WindowStyle$
 None=�5   	    � AllowsTransparency . 
������  J� CommandBindings 5      )  #System.Windows.Input.CommandBinding  5   
   -   5           Command$  local:Command.CloseCommand��5      6T   .��5      �  � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   ��  �� CornerRadius$ 10��6   $��2��6#   
�������
����d�$��2q�6e      PrimaryHueMidBrush#��[  6y   5      �� 5"   
   $��Hidden=�6   .��5#      �� -   5        $��MessageContainer��5#   ;   
���   �$
��18px(�6+   $��WrapWithOverflow=�6S   $��15 30 15 15q�5$      $	��200��6-   $��50��69   $��Center=�6E   $��Bottom=�6b    �� TextAlignment$ Center=�6}   5%      �� 5'   
   -   5        $��ButtonContainer��5'      $��1��6,   	 �� Orientation$	 
Horizontal=�69   $��Center=�5(      $��0,10.4,0,10q�6.   .+�5)      �� -   5        
 ��Name$
 OKBtn��5+      $ ��local:Command.CloseCommand��5)       " MaterialDesignFlatDarkBgButton#��[ 5*      $	��107��5+      $��30��6(   
�������$
��Bold"�5,       $��OK��62   5-      5.      5/      