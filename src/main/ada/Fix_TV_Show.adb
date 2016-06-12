------------------------------------------------------------ {{{1 ---------
--  Copyright © 2016 Martin Krischik
---------------------------------------------------------------------------
--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program.  If not, see «http://www.gnu.org/licenses/».
------------------------------------------------------------ }}}1 ---------

pragma Assertion_Policy (Check);

with Ada.Text_IO;
with Ada.Command_Line;
with GNAT.Regpat;

procedure Fix_TV_Show is
   Pattern : constant GNAT.Regpat.Pattern_Matcher :=
      GNAT.Regpat.Compile ("([[:digit:]]{1,3}) - ([[:digit:]]{1,3})");

   function Get_Sub_String
      (Source   : in String;
       Location : in GNAT.Regpat.Match_Location) return String with
      Pre => Location.First >= Source'First and then Source'Last >= Location.Last;

   function Get_Sub_String
      (Source   : in String;
       Location : in GNAT.Regpat.Match_Location) return String
   is
   begin
      return Source (Location.First .. Location.Last);
   end Get_Sub_String;

begin
   for I in 1 .. Ada.Command_Line.Argument_Count loop
      declare
         File_Name : constant String := Ada.Command_Line.Argument (I);
         Matches   : GNAT.Regpat.Match_Array (0 .. GNAT.Regpat.Paren_Count (Pattern));
      begin
         GNAT.Regpat.Match (Pattern, File_Name, Matches);

         Ada.Text_IO.Put (File_Name);
         Ada.Text_IO.Put (" Season: ");
         Ada.Text_IO.Put (Get_Sub_String (File_Name, Matches (1)));
         Ada.Text_IO.Put (", Episode: ");
         Ada.Text_IO.Put (Get_Sub_String (File_Name, Matches (2)));
         Ada.Text_IO.New_Line;
      end;
   end loop;
end Fix_TV_Show;
