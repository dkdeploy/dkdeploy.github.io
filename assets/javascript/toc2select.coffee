---
---
window.DkdeployApp = 
  Classes: {}

class DkdeployApp.Classes.toc2select
  constructor: (source = "body", target = "body", label = "") ->
    @source_area = $(source)
    @target_area = $(target)
    @elements = []
    @_output = label
  build: ->
    @build_from_source()
    output = "<select id='toc2select' size='1'>"
    for nav in @elements
      if location.hash == "##{nav[0]}"
        output += "<option selected value='#{nav[0]}'>#{nav[1]}</option>"
      else
        output += "<option value='#{nav[0]}'>#{nav[1]}</option>"
    output += "</select>"
    @_output += output
  render: ->
    @build()
    - if @elements.length > 1
      @target_area.html(@_output)
      $('#toc2select').on 'change', ->
        location.hash = $(this).val();
        padding = $(".top-bar.sticky").height()
        header = $("##{$(this).val()}")
        offset = header.offset().top
        window.location.hash = $(this).val()
        new_offset = offset-padding-120
        window.scrollTo(0, new_offset)
        header.addClass("animated").addClass("pulse")
  build_from_source: ->
    tmp_elements = @elements
    @source_area.find('h2').each (index, el) ->
      id = el.getAttribute('id')
      if typeof id isnt 'undefined'
        new_element = [id, el.innerText]
        tmp_elements.push(new_element)
    @elements = tmp_elements