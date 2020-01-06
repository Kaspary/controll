
// // document.addEventListener('DOMContentLoaded', function(){
// //     // do something
// //     initSortTable(document.getElementById('table_earnings'))
// // });


// function orderingTable(table) {
//     let thead = table.querySelector('thead').getElementsByClassName('sorting')
//     let ordering = [{ idx: 0, dir: 'asc' }]


//     table.__ordering = ordering

//     sortTable(table, table.__ordering)


//     thead.addEventListener('click', function onClick(event) {
//         let src = event.target || event.srcElement
//         let tagName = src.tagName.toLowerCase()

//         if (tagName !== 'th') {
//             return
//         }

//         if (!event.shiftKey) {
//             table.__ordering = [
//                 {
//                     idx: src.cellIndex,
//                     dir: src.classList.contains('sorting_asc') ? 'desc' : 'asc'
//                 }
//             ]
//         } else {
//             let order = find(table.__ordering, function (item) {
//                 return item.idx === src.cellIndex
//             })

//             if (order) {
//                 order.dir = order.dir === 'asc' ? 'desc' : 'asc'
//             } else {
//                 table.__ordering.push({
//                     idx: src.cellIndex,
//                     dir: 'asc'
//                 })
//             }
//         }

//         sortTable(table, table.__ordering)
//     }, false)
// }


// function sortTable(table, ordering) {
//     let thead = table.querySelector('thead')
//     let tbody = table.querySelector('tbody')
//     let rows = toArray(tbody.rows)
//     let headers = toArray(thead.getElementsByClassName("sorting"))
//     let current = toArray(thead.querySelectorAll('.sorting_desc, .sorting_asc'))
//     current.filter(function (item) { return !!item }).forEach(function (item) {
//         item.classList.remove('sorting_desc')
//         item.classList.remove('sorting_asc')
//     })
//     headers.filter(function (item) { return !!item }).forEach(function (header, i) {
//         header.classList.remove('sorting_desc')
//         header.classList.remove('sorting_asc')
//     })

//     ordering.forEach(function (order) {
//         let index = order.idx
//         let direction = order.dir || 'asc'
//         let header = headers[index]
//         header.classList.add('sorting_' + direction)
//     })

//     rows.sort(function sorter(a, b) {
//         let i = 0
//         let order = ordering[i]
//         let aText
//         let bText
//         let result = 0
//         let dir
        
//         function is_numeric(value){
//             return new RegExp('^((?:NaN|-?(?:(?:\\d+|\\d*\\.\\d+)(?:[E|e][+|-]?\\d+)?|Infinity)))$').test(String(value))
//         }

//         while (order && result === 0) {
//             dir = order.dir === 'desc' ? -1 : 1
            
//             if (a.cells[order.idx].querySelector('input')){
//                 aText = a.cells[order.idx].querySelector('input').value.trim()
//             }else if(a.cells[order.idx].querySelector('select')){
//                 let select = a.cells[order.idx].querySelector('select')
//                 aText = select.options[select.selectedIndex].text.trim()
//             }else if(a.cells[order.idx].querySelector('a')){
//                 aText = a.cells[order.idx].querySelector('a').classList.contains("fix-active") ? 'a' : 'b'
//             }else if(a.cells[order.idx].textContent.trim()){
//                 aText = a.cells[order.idx].textContent.trim()
//             }

//             if (b.cells[order.idx].querySelector('input')){
//                 bText = b.cells[order.idx].querySelector('input').value.trim()
//             }else if(b.cells[order.idx].querySelector('select')){
//                 let select = b.cells[order.idx].querySelector('select')
//                 bText = select.options[select.selectedIndex].text.trim()
//             }else if(b.cells[order.idx].querySelector('a')){
//                 bText = b.cells[order.idx].querySelector('a').classList.contains("fix-active") ? 'a' : 'b'
//             }else if(b.cells[order.idx].textContent.trim()){
//                 bText = b.cells[order.idx].textContent.trim()
//             }
            
//             if (is_numeric(aText) && is_numeric(bText)) {
//                 result = dir * (parseFloat(aText) - parseFloat(bText))
//             } else {
//                 result = dir * aText.localeCompare(bText)
//             }

//             i += 1
//             order = ordering[i]
//         }
//         return result
//     }).forEach(function each(row) {
//         tbody.appendChild(row)
//     })
// }



// function toArray(value) {
//     if (!value) {
//         return []
//     }
//     if (Array.isArray(value)) {
//         return value
//     }
//     if (value instanceof window.NodeList || value instanceof window.HTMLCollection) {
//         return Array.prototype.slice.call(value)
//     }
//     return [value]
// }



// function find(array, predicate) {
//     return toArray(array).filter(predicate)[0]
// }



