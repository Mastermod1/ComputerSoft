/* Zadanie 1
Napisz skrypt, który będzie mógł być „doklejany" do dowolnego dokumentu html. Powinien
umożliwiać podanie przez użytkownika nazwy elementu lub jego klasy css, a następnie wyświetlać
treść wszystkich wystąpień tego elementu w dokumencie (DOM).
Zadanie powinno być wykonany przy użyciu czystego języka JavaScript.
Po wejściu na stronę (index.html) skrypt automatycznie się włącza, np. alert box pozwalający użytkownikowi na wpisanie klasy css lub nazwy elementu DOM (.class, p, div).
Skrypt po zatwierdzeniu przez użytkownika alertu powinien wyświetlić wszystkie wystąpienia danych elementów.
Wyświetlanie wyniku jest dowolne (np. console.log, kolejny alert).
*/
let searchValue = window.prompt("Podaj nazwe tagu lub klase:");
let items = document.querySelectorAll(searchValue);
let itemsCopy = [];
for(let i = 0; i < items.length; i++){
    itemsCopy.push(items[i].cloneNode(true)); // Wstawianie kopii elementów aby nie modyfikować głównej strony
}
itemsCopy.forEach(item => {
    if(!item.querySelector(searchValue)){
        console.log(item.innerHTML);
        return;
    }
    while(item.querySelector(searchValue)){
        item.removeChild(item.querySelector(searchValue));
    }
    console.log(item.innerHTML);
});
//Stary kod:
//window.alert(Array.from(items).map((item, iter) => ` ${iter}. ${item.innerText}`).join("\n"));
