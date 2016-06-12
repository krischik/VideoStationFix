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

--  @summary
--  Reading iTunes informations
--
--  @description
--  This package provides routines reading informations form iTunes organised movies
--
package ITunes is

   --  A season number. Video station seem to have only one byte reserved. Note that 0 is usualy
   --  considered “no sesason”
   --
   type Season_Number is range 0 .. 255;

   --  A episode number. Video station seem to have only one byte reserved. Note that 0 is
   --  usualy considered “no sesason”
   --
   type Episode_Number is range 0 .. 255;

   -- Episode of a TV-Show
   --
   -- @field Season of the TV-Show
   -- @field Episode of the TV-Show
   type Episode_Info is record
      Season  : Season_Number;
      Episode : Episode_Number;
   end record;

   --  extract season and episode info from iTunes style filename
   --
   function Get_Episode_Info (File_Name : in String) return Episode_Info with
      Pre => File_Name'Length >= 5;

private
      --  pragma Pure_Function (Get_Episode_Info);

end ITunes;

--  vim: set nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab : vim: set textwidth=0
--  filetype=ada foldmethod=expr nospell :
