$(document).on("pagebeforeshow","#home",function(){
    var corretor = JSON.parse(window.localStorage.getItem('corretor'));
    $('#nomeCorretorHome').html(corretor.Nome);
});

function logout(){
window.localStorage.clear();
redirect('#default','slidedown');
}