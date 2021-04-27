if (location.pathname.match("topics/new")){
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("topics_tag_tagname");
    inputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("topics_tag_tagname").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `tagsearch/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const searchResult = document.getElementById("search-result");
        searchResult.innerHTML = "";
        if (XHR.response) {
          const tagName = XHR.response.keyword;
          tagName.forEach((tag) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", tag.id);
            childElement.innerHTML = tag.tagname;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(tag.id);
            clickElement.addEventListener("click", () => {
              document.getElementById("topics_tag_tagname").value = clickElement.textContent;
              clickElement.remove();
            });
          });
        };
      };
    });
  });
};