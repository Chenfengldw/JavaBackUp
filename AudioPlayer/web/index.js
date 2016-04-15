/**
 * Created by Administrator on 2016/4/12.
 */
function $(s){
    return document.querySelectorAll(s);
}

var list = $("#list li");
document.write("<p>My First JavaScript</p>");
for(var i=0;i<list.length;++i){
    list[i].onclick = function(){
        for(var j=0;j<list.length;++j){
            list[j].className = "";
        }
        list[i].className = "selected";
    }
}