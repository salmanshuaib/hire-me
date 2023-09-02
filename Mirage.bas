Attribute VB_Name = "Mirage"

Function Mirage()
    '''''''Format Excel sheet
'    Dim ws As Worksheet
'    Set ws = ThisWorkbook.Sheets.Add
'    Dim wsName As String
'    wsName = "Employment Search"
'
'
'        With ws
'                .Cells(1, 1).Value = "SERIAL NUMBER"
'                .Cells(1, 2).Value = "EMPLOYMENT AGENCY"
'                .Cells(1, 3).Value = "WEBSITE"
'                .Cells(1////////, 4).Value = "TELEPHONE"
'                .Cells(1, 5).Value = "ADDRESS"
'                .Cells(1, 6).Value = "APPLIED ONLINE?"
'                .Cells(1, 7).Value = "CALLED?"
'                .Cells(1, 8).Value = "TEL APPOINTMENT?"
'                .Cells(1, 9).Value = "INTERVIEW?"
'                .Cells(1, 10).Value = "SUCCESS"
'gdggd
'                ' Formatting
'                Dim col As Long
'                For col = 1 To 10
'                    .Columns(col).AutoFit ' Autofit to content
'                    .Columns(col).ColumnWidth = .Columns(col).ColumnWidth + 5 ' Add some extra width
'                    .Cells(1, col).Font.Bold = True
'                    .Cells(1, col).Interior.Color = RGB(0, 255, 255)
'                    .Cells(1, col).Borders.Weight = xlThick
'                Next col
'            End With
'
'    MsgBox ("Formatting COMPLETE")
    
    '''''''Launch NAVIGATOR
    Dim colAddy As Long
    Dim RoAddy As Long
    
    If (StrPtr(colAddy)) <> 0 Then
        colAddy = InputBox("Enter heading, for example: 2", "navigator")
        'Find the last used row in the specified column
        RoAddy = ThisWorkbook.Sheets("Employment Search").Cells(ThisWorkbook.Sheets("Employment Search").Rows.Count, colAddy).End(xlUp).Row
        
        'If the column is completely empty, it would select the first row.
        'Otherwise, it will select the row next to the last used row.
        If RoAddy = 1 And ThisWorkbook.Sheets("Employment Search").Cells(1, colAddy).Value = "" Then
            ThisWorkbook.Sheets("Employment Search").Cells(1, colAddy).Select
        Else
            ThisWorkbook.Sheets("Employment Search").Cells(RoAddy + 1, colAddy).Select
        End If
    Else:
        pilot = CallRaptor()
    End If
    
End Function

Function CallRaptor()
    ROMMIE = Mirage()
End Function

