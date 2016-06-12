------------------------------------------------------------ {{{1 ---------
--  Copyright © 2016 Martin Krischik
---------------------------------------------------------------------------
--  This program is free software: you can redistribute it and/or modify it under the terms of
--  the GNU General Public License as published by the Free Software Foundation, either version
--  3 of the License, or (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
--  without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--  See the GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License along with this program.
--  If not, see «http://www.gnu.org/licenses/».
------------------------------------------------------------ }}}1 ---------

--  pragma Assertion_Policy (Check);
with GNAT.Regpat;
with Ada.Text_IO;

package body ITunes is
   Pattern : constant GNAT.Regpat.Pattern_Matcher :=
      GNAT.Regpat.Compile ("([[:digit:]]{1,3})-([[:digit:]]{1,3})");

   function Get_Sub_String
      (Source   : in String;
       Location : in GNAT.Regpat.Match_Location) return String with
      Pre => Location.First >= Source'First and then Source'Last >= Location.Last;
   pragma Pure_Function (Get_Sub_String);

   function Get_Sub_String
      (Source   : in String;
       Location : in GNAT.Regpat.Match_Location) return String
   is
   begin
      -- Ada.Text_IO.Put (Source);
      -- Ada.Text_IO.Put (" ");
      -- Ada.Text_IO.Put (Natural'Image (Location.First)); 
      -- Ada.Text_IO.Put (" ");
      -- Ada.Text_IO.Put (Natural'Image (Location.Last));
      -- Ada.Text_IO.New_Line;

      return Source (Location.First .. Location.Last);
   end Get_Sub_String;

   --  extract season and episode info from iTunes style filename
   --
   function Get_Episode_Info (File_Name : in String) return Episode_Info is
      Matches : GNAT.Regpat.Match_Array (0 .. GNAT.Regpat.Paren_Count (Pattern));
      Retval  : Episode_Info;
   begin
      GNAT.Regpat.Match (Pattern, File_Name, Matches);

      declare
         Season_Text  : constant String := Get_Sub_String (File_Name, Matches (1));
         Episode_Text : constant String := Get_Sub_String (File_Name, Matches (2));
      begin
         Ada.Text_IO.Put (File_Name);
         Ada.Text_IO.Put (" Season: ");
         Ada.Text_IO.Put (Season_Text);
         Ada.Text_IO.Put (", Episode: ");
         Ada.Text_IO.Put (Episode_Text);
         Ada.Text_IO.New_Line;

         Retval.Season  := Season_Number'Value (Season_Text);
         Retval.Episode := Episode_Number'Value (Episode_Text);
      end;
      return Retval;
   end Get_Episode_Info;

end ITunes;

--  vim: set nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab : vim: set textwidth=0
--  filetype=ada foldmethod=expr nospell :
