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

with Ada.Text_IO;
with Ada.Command_Line;

procedure Fix_TV_Show is
begin
   for I in 1 .. Ada.Command_Line.Argument_Count loop
      declare
         File_Name : constant String := Ada.Command_Line.Argument (I);
      begin
         Ada.Text_IO.Put_Line (File_Name);

      end;
   end loop;
   Ada.Text_IO.Put_Line ("Hello, world!");
end Fix_TV_Show;
