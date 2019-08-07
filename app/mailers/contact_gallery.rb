class ContactGallery < ApplicationMailer
    #작가와 관련된 문의 메일 보내기
    def send_email sender, email, message, m_id, m_title, m_artist
        mail from: email, #보내는 사람
             to: 'myahn0607@gmail.com', #받는 사람
             subject: '[paintingfarm 작품문의] ' + sender, #제목
             body: '문의작품: ' + m_id + '/' + '작품명:' + m_title + '/ 작가: ' + m_artist + '/' +
                   '문의내용: ' + message #내용
    end
    
    #home/index에서 문의 메일 보내기
    def send_email2 sender, email, message
        mail from: email, #보내는 사람
             to: 'myahn0607@gmail.com', #받는 사람
             subject: '[paintingfarm 문의] ' + sender, #제목
             body: '문의내용: ' + message #내용
    end    
    
end
