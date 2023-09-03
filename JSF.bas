Attribute VB_Name = "JSF"
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
    
Function JSF()
    '''''''Launch NAVIGATOR
    Dim Bravo As String  ' Change this to String since InputBox returns String
    Dim colNumber As Long
    Dim Tango As Long
    Dim userInputText As String
    Dim userInputNote As String
    Dim selectedCell As Range

    Bravo = InputBox("Enter HEADING, For Example: 2", "NAVIGATOR")
    
    ' Exit if the user hits Cancel
    If Bravo = "" Then Exit Function
    
    ' Check if the user input is a number
    If IsNumeric(Bravo) Then
        colNumber = CLng(Bravo) ' Convert the string to a long

        'Find the last used row in the specified column
        Tango = ThisWorkbook.Sheets("Employment Search").Cells(ThisWorkbook.Sheets("Employment Search").Rows.Count, colNumber).End(xlUp).Row
        
        'If the column is completely empty, it would select the first row.
        'Otherwise, it will select the row next to the last used row.
        If Tango = 1 And ThisWorkbook.Sheets("Employment Search").Cells(1, colNumber).Value = "" Then
            Set selectedCell = ThisWorkbook.Sheets("Employment Search").Cells(1, colNumber)
        Else
            Set selectedCell = ThisWorkbook.Sheets("Employment Search").Cells(Tango + 1, colNumber)
        End If
        
        ' Highlight the selected cell
        selectedCell.Select
        
        ' Ask user for the text input
        userInputText = InputBox("Enter your text:", "NAVIGATOR - Text Entry")
        
        ' Exit if the user hits Cancel
        If userInputText = "" Then Exit Function
        selectedCell.Value = userInputText
        
        ' Ask user for the comment
        userInputNote = InputBox("Enter your note:", "NAVIGATOR - Note Entry")
        
        ' Exit if the user hits Cancel
        If userInputNote = "" Then Exit Function
        
        ' If user provided a comment
        If Not selectedCell.Comment Is Nothing Then
            selectedCell.Comment.Delete ' Delete existing comment if it exists
        End If
        selectedCell.AddComment Text:=userInputNote
        selectedCell.Comment.Shape.Fill.ForeColor.RGB = RGB(255, 255, 0) ' Set comment color to red

    Else
        pilot = CallMiragesEscort(Bravo)
    End If
End Function

Function CallMiragesEscort(Goddess As String)
    Goddess = JSF()
'    Dim XWoman As Integer
'    XWoman = CInt(Goddess)
'    If (XWoman = 1) Or (XWoman = 2) Or (XWoman = 3) Or (XWoman = 4) Or (XWoman = 5) Or (XWoman = 6) Or (XWoman = 7) Or (XWoman = 8) Or (XWoman = 9) Or (XWoman = 10) Then
'        LatentSupremacy = JSF()
'    Else
'        MsgBox ("Please Enter a Number Only_")
'    End If
End Function




