class ContactGallery < ApplicationMailer
    def send_email sender, email, message
        mail from: email, #보내는 사람
             to: 'myahn0607@gmail.com', #받는 사람
             subject: '[paintingfarm 문의] ' + sender, #제목
             body: message #내용
    end
end
