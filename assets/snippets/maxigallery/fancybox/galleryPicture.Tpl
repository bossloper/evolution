<li>
    <a href="[(base_url)][+maxigallery.path_to_gal+][+maxigallery.picture.filename+]" class="galleryfancybox" rel="gallery[+maxigallery.picture.gal_id+]">
        <img src="[(base_url)][+maxigallery.path_to_gal+]tn_[+maxigallery.picture.filename+]" class="thumbnail" title="[+maxigallery.picture.title:htmlent+]
        [+maxigallery.strings.click_to_zoom+]" alt="[+maxigallery.picture.title:htmlent+]
[+maxigallery.picture.descr:isnot=``:then=` -- [+maxigallery.picture.descr:htmlent:nl2br+]`+]
 " />
    </a>
    [+maxigallery.picture.title:isnot=``:then=`
        <p style="width: [+maxigallery.picture_width_thumb+]px;">
            [+maxigallery.picture.title:htmlent:nl2br+]
        </p>
    `+]
</li>