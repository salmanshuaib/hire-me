Attribute VB_Name = "Mirage"
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
'
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
    
    

Function MIRAGE()
    '''''''Launch NAVIGATOR
    Dim colAddy As String ' Change this to String since InputBox returns String
    Dim colNumber As Long
    Dim RoAddy As Long

    colAddy = InputBox("Enter heading, for example: 2", "NAVIGATOR")
    
    ' Check if the user input is a number
    If IsNumeric(colAddy) Then
        colNumber = CLng(colAddy) ' Convert the string to a long

        'Find the last used row in the specified column
        RoAddy = ThisWorkbook.Sheets("Employment Search").Cells(ThisWorkbook.Sheets("Employment Search").Rows.Count, colNumber).End(xlUp).Row
        
        'If the column is completely empty, it would select the first row.
        'Otherwise, it will select the row next to the last used row.
        If RoAddy = 1 And ThisWorkbook.Sheets("Employment Search").Cells(1, colNumber).Value = "" Then
            ThisWorkbook.Sheets("Employment Search").Cells(1, colNumber).Select
        Else
            ThisWorkbook.Sheets("Employment Search").Cells(RoAddy + 1, colNumber).Select
        End If
    Else
        ' If the user input is not a number or the InputBox was cancelled
        pilot = CallRaptor()
    End If
    
End Function

Function CallRaptor()
    ROMMIE = MIRAGE()
End Function


