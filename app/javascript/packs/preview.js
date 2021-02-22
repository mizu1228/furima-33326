if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
   const ImgPreview = document.getElementById('img-preview');
   document.getElementById('item-image').addEventListener('change', function(e){
     const file = e.target.files[0];
     const blob = window.URL.createObjectURL(file);

     const imageElement = document.createElement('div');
     const blobImage = document.createElement('img');
     blobImage.setAttribute('src', blob);
     blobImage.setAttribute('class', "img-prv");

     imageElement.appendChild(blobImage);
     ImgPreview.appendChild(imageElement);
    });
  });
};