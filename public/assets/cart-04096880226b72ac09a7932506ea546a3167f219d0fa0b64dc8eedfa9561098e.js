function changePrice(id, value){
  function renderTotal(){
    var elem = document.getElementById("sub"+id);
    var tmp = elem.innerHTML.substring(1, elem.innerHTML.length);
    elem.innerHTML = "$"+(parseFloat(elem.getAttribute("name")) * value).toFixed(1);
    tmp = parseFloat(elem.getAttribute("name")) * value - tmp;
    $("#total-price").text(parseFloat(parseFloat($("#total-price").text())+tmp).toFixed(1));
  };
  $.ajax({
    url: "cart/update",
    type: "GET",
    data: ({id: id, quantity: value}),
    dataType: 'html',
    success: renderTotal
  });
};
