# = require simditor/module
# = require simditor/hotkeys
# = require simditor/uploader
# = require simditor/simditor
# = require turbolinks

$(document).ready ->
  editor = new Simditor(
    textarea: $('.simditor')
    toolbar: [
      'title','bold','italic','underline','strikethrough','color','|'
      'ol','ul','blockquote','code','table','link','image','hr','|'
      'indent','outdent', 'fontScale', 'alignment'
    ]
    pasteImage: true
    upload: url: '/admin/topics/upload'    
  )
