@echo off

@rem USAGE: "MAKE HACK_full.cmd" [quick]
@rem If first argument is "quick", then this will not update text, tables, or generate a patch
@rem "MACK HACK_quick.cmd" simply calls this but with the quick argument, for convenience

@rem defining buildfile config

set "source_rom=%~dp0ROMs\BPS.gba"

set "main_event=%~dp0ROM Buildfile.event"

set "target_rom=%~dp0ROMs\TNH.gba"
set "target_ups=%~dp0ROMs\TNH.ups"

@rem defining tools

set "c2ea=%~dp0Tools\C2EA\c2ea"
set "textprocess=%~dp0Tools\TextProcess\text-process-classic.exe"
set "tmx2ea=%~dp0Tools\tmx2ea\tmx2ea.exe"
set "ups=%~dp0Tools\ups\ups.exe"
set "parsefile=%~dp0Event Assembler\Tools\ParseFile.exe"

@rem set %~dp0 into a variable because batch is stupid and messes with it when using conditionals?

set "base_dir=%~dp0"

@rem do the actual building

echo:
echo Copying ROM

copy "%source_rom%" "%target_rom%"

if /I not [%1]==[quick] (

  @rem only do the following if this isn't a make hack quick

  echo:
  echo Processing text

  cd "%base_dir%Text"
  echo: | ("%textprocess%" text_buildfile.txt --parser-exe "%parsefile%")

  echo:
  echo Processing maps
  echo:

  cd "%base_dir%Maps"
  echo: | ("%tmx2ea%" -s)
  echo:

)

echo:
echo Assembling

cd "%base_dir%Event Assembler"
ColorzCore A FE8 "-output:%target_rom%" "-input:%main_event%"

if /I not [%1]==[quick] (

  @rem only do the following if this isn't a make hack quick

  echo:
  echo Generating patch

  cd "%base_dir%"
  "%ups%" diff -b "%source_rom%" -m "%target_rom%" -o "%target_ups%"

)

echo:
echo Done!

pause
