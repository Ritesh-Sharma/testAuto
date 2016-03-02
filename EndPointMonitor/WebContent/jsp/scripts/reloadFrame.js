function change2(page)
{
    parent.TIMTable.location=page;
}

function changeContent(id,className)
{
    parent.TIMTable.location='TIMTable.jsp?id='+id+'&class='+className;
    parent.TIGraph.location='TIGraph.jsp?id='+id+'&class='+className;
    parent.TMGraph.location='TMGraph.jsp?id='+id+'&class='+className;
    parent.ClassHeader.location='ClassHeader.jsp?id='+id+'&class='+className;
    parent.SessionId.location='SessionId.jsp?id='+id+'&class='+className;
}