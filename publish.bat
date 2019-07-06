cd /d %~dp0
rd /Q /S bin

cd src
rd /Q /S bin

dotnet publish -c release -r win-x64 --self-contained

md ..\bin
move bin\release\netcoreapp2.2\win-x64\publish ..\bin\lib

md ..\bin\lib\template\
copy template\template_cover.txt ..\bin\lib\template\template_cover.txt
copy template\template_ncx.txt ..\bin\lib\template\template_ncx.txt
copy template\template_opf.txt ..\bin\lib\template\template_opf.txt

rd /Q /S bin
rd /Q /S obj

cd ..
copy dedrm.bat bin\dedrm.bat
copy template_batch\_Tool_Drop_Dump_azwres.txt bin\_Tool_Drop_Dump_azwres.bat
copy template_batch\_Tool_Drop_MyKindleContent.txt bin\_Tool_Drop_MyKindleContent.bat
copy template_batch\_Tool_Drop_Single.txt bin\_Tool_Drop_Single.bat
copy template_batch\_Tool_Drop_Single_dedrm.txt bin\_Tool_Drop_Single_dedrm.bat

pause