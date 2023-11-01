console.log("ㄴㄴㄴ")

async function del(num){
    let meg = confirm("삭제하시면 본문에서도 삭제됩니다. 계속하시겠습니까? ");
    if(meg){
    let delbtn = document.getElementById('img'+num);
 
    
    let uuid =delbtn.dataset.uuid;
    try {
        const url ='/board/delete/'+uuid;
        const config = {
            method : "delete"
        };
        const resp = await fetch(url,config);
        const result = await resp.text();
        if(result>0){
        document.getElementById('img'+num).remove();

        }
        return result;        
    } catch (error) {
        console.log(error);
    }
}

}