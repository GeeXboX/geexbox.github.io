function getElement (id)
{
  if (!document.getElementById)
    return;

  if (document.all)
    return eval ("document.all." + id)
  else
    return document.getElementById (id)
}

function DisplayS (id)
{
  getElement(id).style.display = (getElement(id).style.display == "none" ? "" : "none");
}

function toggle (id, id2, id3)
{
  DisplayS (id);
  DisplayS (id2);
  DisplayS (id3);
}
