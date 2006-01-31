function getElement (id)
{
  if (!document.getElementById)
    return;

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
