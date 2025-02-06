(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
  key: process.env.Maps_API_Key
});

let map;

async function initMap() {
  const { Map } = await google.maps.importLibrary("maps");
  const {AdvancedMarkerElement} = await google.maps.importLibrary("marker")
  let latitude = document.getElementById("map").getAttribute("latitude")
  let longitude = document.getElementById("map").getAttribute("longitude")
  console.log(latitude)
  console.log(longitude)
  map = new Map(document.getElementById("map"), {
//    center: { lat: 35.681236, lng: 139.767125 }, 
    center: { lat: Number.parseFloat(latitude), lng: Number.parseFloat(longitude) }, 
    zoom: 8,
    mapId: "DEMO_MAP_ID",
    mapTypeControl: false
  });
  try {
    let url = '';
    if (location.pathname == "/map" ) {
      url =  location.href.replace('/map?','/map.json?');
    }
    else{
      url = "/posts.json";
    }
    const response = await fetch(url);
    if (!response.ok) throw new Error('Network response was not ok');

    const { data: { items } } = await response.json();
    if (!Array.isArray(items)) throw new Error("Items is not an array");
    items.forEach( item => {
      const latitude = item.latitude;
      const longitude = item.longitude;
      const title = item.title;

      const marker = new google.maps.marker.AdvancedMarkerElement ({
        position: { lat: latitude, lng: longitude },
        map,
        title: title,
        // 他の任意のオプションもここに追加可能
      });
    });
  } catch (error) {
  }
  
}
console.log("AAA");

initMap()