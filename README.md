# README
#ドロップダウン
.dropdown
      %button.btn.btn-secondary.btn-danger.dropdown-toggle.Menu__regular__btn-regular#dropdownMenuButton{type: "button",data: {toggle: "dropdown"},aria: {haspopup: "true",expanded: "false"}}
        .btn-font-size
          調査費
      .dropdown-menu{aria: {labelledby: "dropdownMenuButton"}}
        %a{class: "dropdown-item", href: '/regulars/new'}
          登録
        %a{class: "dropdown-item", href: "/regulars/#{current_user.id}"}
          確認  
