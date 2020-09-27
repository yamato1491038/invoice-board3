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

モーダル
  %button.btn.btn-danger{type: "button",data: {toggle: "modal", target: "#staticBackdrop"}}
      削除
    .modal.fade#staticBackdrop{data: {backdrop: "static", keyboard: "false"}, tabindex: "-1",aria:{labelledby: "staticBackdropLabel", hidden: "true"}}
      .modal-dialog
        .modal-content
          .modal-header
            %h3.modal-title#staticBackdropLabel
              確認
            %button.close{type:"button", data:{dismiss: "modal"}, aria:{label: "Close"}}
              %span{aria:{hidden: "true"}}
                &times;
          .modal-body
            %p
              本当に削除しますか？
          .modal-footer
            %button.btn.btn-default{type:'button', data:{dismiss:'modal'}}
              戻る
          
モーダル番号振り分け
  %button.btn.btn-danger{type: "button",data: {toggle: "modal", target: "#staticBackdrop#{user.id}"}}
                  締め削除
                .modal.fade{id: "staticBackdrop#{user.id}", data: {backdrop: "static", keyboard: "false"}, tabindex: "-1",aria:{labelledby: "staticBackdropLabel", hidden: "true"}}
                  .modal-dialog
                    .modal-content
                      .modal-header
                        %h3.modal-title#staticBackdropLabel
                          確認
                        %button.close{type:"button", data:{dismiss: "modal"}, aria:{label: "Close"}}
                          %span{aria:{hidden: "true"}}
                            &times;
                      .modal-body
                        %h5
                          本当に削除しますか？締めを解除すると全ての決済も解除されます。
                      .modal-footer
                        %button.btn.btn-default{type:'button', data:{dismiss:'modal'}}
                          戻る
                        = form_with url: "/closings/:id", local: true, method: :delete, class: "" do |f|
                          = f.hidden_field :dating, value: "#{@year}-#{@month}-01"
                          = f.hidden_field :user_id, value: user.id
                          = f.submit "締めを解除#{user.id}", class: "btn btn-lg btn-danger"
