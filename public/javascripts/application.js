$.fn.autoResize = function () {
  $(this).each((i, element) => {
    const $element = $(element)
    const totalHeight = window.innerHeight
    const offset = totalHeight - $element.data('offset')
    console.log([totalHeight, offset])

    $element.css('max-height', offset).css('min-height', offset)
  })
}

$(document).ready( () => {
  $('.js-autoResize').autoResize()
  $('#cardPreview').modal({ show: false })

  $(window).resize(function () {
    $('.js-autoResize').autoResize()
  })

  $('#previewButton').on('click', (event) => {
    event.preventDefault()
    $('#cardPreview').modal('toggle')
  })

  $('.modal-header button.close').on('click', (event) => {
    event.preventDefault()
    $('#cardPreview').modal('toggle')
  })

  $('#downloadButton').on('click', (event) => {
    event.preventDefault()
    const url = '/cardset.pdf?' + $('form#configForm').serialize()
    window.location.href = url
  })
})
