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

pragma Assertion_Policy (Check);

with Ada.Text_IO;
with Ada.Command_Line;

with ITunes;

procedure Fix_TV_Show is

begin
   for I in 1 .. Ada.Command_Line.Argument_Count loop
      declare
         File_Name : constant String     := Ada.Command_Line.Argument (I);
         Episode   : ITunes.Episode_Info := ITunes.Get_Episode_Info (File_Name);
      begin

         Ada.Text_IO.New_Line;
      end;
   end loop;
end Fix_TV_Show;

--  vim: set nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab : vim: set textwidth=0
--  filetype=ada foldmethod=expr nospell :
