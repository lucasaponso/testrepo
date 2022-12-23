New-PSDrive -Name "P" -PSProvider "FileSystem" -Root "\\dcacara\AvaraFileServer" -Persist
New-PSDrive -Name "T" -PSProvider "FileSystem" -Root "\\dcacara\TransientData" -Persist
New-PSDrive -Name "I" -PSProvider "FileSystem" -Root "\\dcacara\AvaraIntranet" -Persist
New-PSDrive -Name "S" -PSProvider "FileSystem" -Root "\\dcacara\CyntilaFileServer" -Persist
