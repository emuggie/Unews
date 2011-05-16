$.ajaxSetup(
    {   
      beforeSend: function(xhr) {     
                    xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));   
                  }
    });
$.ajaxSetup(
    {
      beforeSubmit: function(xhr){
                      xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
                    } 
    });  
function vote_right(article_id)
{
  $.get("/articles/vote_right.json?id="+article_id,function(){alert('voted');voted();});
  voted();
}

function vote_wrong(article_id)
{
  $.get("/articles/vote_wrong.json?id="+article_id,function(){alert('voted'); voted();});
  voted();   
}
function voted()
{
  document.getElementById('vote_right').src="/images/right-disabled.png";
  document.getElementById('vote_wrong').src="/images/wrong-disabled.png";
}
function fetch_article(content)
{
  $.get("/articles/"+content.id,function(req) {display_preview(req);});
}
function display_preview(html)
{  
  document.getElementById('article_preview').innerHTML=html;
}
//add_new_comment
function write_comment(article_id)
{
  $.post("/comments/create",{comment: document.getElementById('comment').value, id:article_id },function(html){display_comments(html)});
}
function display_comments(html)
{
  document.getElementById('user_comments').innerHTML=html;
}
function cursor_on_article(content)
{
  //highlight chosen article
  content.style.fontWeight='bold';
}
function cursor_out_article(content)
{
  content.style.fontWeight='normal';
}
  
function click_on_article(id)
{
  //move to acticle or display article in ajax move
  //var cursor = (window.event)?window.event : evt;
  //document.getElementById('article_preview').style.left = cursor.clientX;
  //document.getElementById('article_preview').style.top = cursor.clientY;
  document.getElementById('article_preview').style.visibility='visible';
  var article=fetch_article(id);
}
function hide_preview()
{
  document.getElementById('article_preview').style.visibility='hidden';
}  
function display_form()
{
  document.getElementById('article_form').style.visibility='visible';
  document.getElementById('article_form').value='Cancel';
}

function hide_form()
{
  document.getElementById('article_form').style.visibility='hidden';
  document.getElementById('article_form').value='Write';
}

function vise_versa_display()
{
  if (document.getElementById('article_form').style.visibility=='hidden')
    display_form();  
  else
    hide_form();    
}
      
function locate_article(evt)
{
  if (window.confirm("paste here?"))
  {
    var cursor = (window.event)?window.event : evt;
    document.onmousemove = null;
    document.onmousedown = null;
    var cord_x = cursor.clientX;
    var cord_y = cursor.clientY;
    document.getElementById('cord_x').value=cord_x;
    document.getElementById('cord_y').value=cord_y;
          
    var article_form=document.getElementById('new_article');
    article_form.method="post";
    article_form.action="/articles/create";
    article_form.submit();
  }else{
    document.onmousedown = null;
    document.onmousemove = null;
    document.getElementById('iit').style.visibility='hidden';
  }
}

function adjust_article(evt)
{
  hide_form();
  document.getElementById('iit').innerHTML = document.getElementById('article_title').value;
  document.onmousemove = move_title;
  document.onmousedown = locate_article;
}
 
var newtop=0
var newleft=0
if (navigator.appName == "Netscape") 
{
  layerStyleRef="layer.";
	layerRef="document.layers";
	styleSwitch="";
}
else
{
  layerStyleRef="layer.style.";
	layerRef="document.all";
	styleSwitch=".style";
}

function move_title() 
{ 
	layerName = 'iit'
  
  eval('var curElement='+layerRef+'["'+layerName+'"]')
  eval(layerRef+'["'+layerName+'"]'+styleSwitch+'.visibility="hidden"')
  eval('curElement'+styleSwitch+'.visibility="visible"')
  eval('newleft=document.body.clientWidth-curElement'+styleSwitch+'.pixelWidth')
  eval('newtop=document.body.clientHeight-curElement'+styleSwitch+'.pixelHeight')
	eval('height=curElement'+styleSwitch+'.height')
	eval('width=curElement'+styleSwitch+'.width')
	width=parseInt(width)
	height=parseInt(height)
	if (event.clientX > (document.body.clientWidth - 5 - width))
	{
		newleft=document.body.clientWidth + document.body.scrollLeft - 5 - width
	}
	else
	{
		newleft=document.body.scrollLeft + event.clientX
	}
  eval('curElement'+styleSwitch+'.pixelLeft=newleft')
 
  if (event.clientY > (document.body.clientHeight - 5 - height))
	{
		newtop=document.body.clientHeight + document.body.scrollTop - 5 - height
	}
	else
	{
    newtop=document.body.scrollTop + event.clientY
	}
	eval('curElement'+styleSwitch+'.pixelTop=newtop')
}

