package main.java.dao.model.api;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/*
 * 驾照考题
 */
public class DriveSubjectDo implements Serializable {
    private static final long serialVersionUID = 1482887439466L;

    private Long id;
    private Integer subject;
    private String model;
    private String sourceId;
    private String question;
    private String answer;
    private String url;
    private String explains;
    private String item1;
    private String item2;
    private String item3;
    private String item4;
    private String item1Flag;
    private String item2Flag;
    private String item3Flag;
    private String item4Flag;
    private Integer status;
    private Date gmtCreate;
    private Date gmtModify;

    public void setId(Long id) {
        this.hasId = Boolean.TRUE;
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setSubject(Integer subject) {
        this.hasSubject = Boolean.TRUE;
        this.subject = subject;
    }

    public Integer getSubject() {
        return subject;
    }

    public void setModel(String model) {
        this.hasModel = Boolean.TRUE;
        this.model = model;
    }

    public String getModel() {
        return model;
    }

    public void setSourceId(String sourceId) {
        this.hasSourceId = Boolean.TRUE;
        this.sourceId = sourceId;
    }

    public String getSourceId() {
        return sourceId;
    }

    public void setQuestion(String question) {
        this.hasQuestion = Boolean.TRUE;
        this.question = question;
    }

    public String getQuestion() {
        return question;
    }

    public void setAnswer(String answer) {
        this.hasAnswer = Boolean.TRUE;
        this.answer = answer;
    }

    public String getAnswer() {
        return answer;
    }

    public void setUrl(String url) {
        this.hasUrl = Boolean.TRUE;
        this.url = url;
    }

    public String getUrl() {
        return url;
    }

    public void setExplains(String explains) {
        this.hasExplains = Boolean.TRUE;
        this.explains = explains;
    }

    public String getExplains() {
        return explains;
    }

    public void setItem1(String item1) {
        this.hasItem1 = Boolean.TRUE;
        this.item1 = item1;
    }

    public String getItem1() {
        return item1;
    }

    public void setItem2(String item2) {
        this.hasItem2 = Boolean.TRUE;
        this.item2 = item2;
    }

    public String getItem2() {
        return item2;
    }

    public void setItem3(String item3) {
        this.hasItem3 = Boolean.TRUE;
        this.item3 = item3;
    }

    public String getItem3() {
        return item3;
    }

    public void setItem4(String item4) {
        this.hasItem4 = Boolean.TRUE;
        this.item4 = item4;
    }

    public String getItem4() {
        return item4;
    }

    public void setItem1Flag(String item1Flag) {
        this.hasItem1Flag = Boolean.TRUE;
        this.item1Flag = item1Flag;
    }

    public String getItem1Flag() {
        return item1Flag;
    }

    public void setItem2Flag(String item2Flag) {
        this.hasItem2Flag = Boolean.TRUE;
        this.item2Flag = item2Flag;
    }

    public String getItem2Flag() {
        return item2Flag;
    }

    public void setItem3Flag(String item3Flag) {
        this.hasItem3Flag = Boolean.TRUE;
        this.item3Flag = item3Flag;
    }

    public String getItem3Flag() {
        return item3Flag;
    }

    public void setItem4Flag(String item4Flag) {
        this.hasItem4Flag = Boolean.TRUE;
        this.item4Flag = item4Flag;
    }

    public String getItem4Flag() {
        return item4Flag;
    }

    public void setStatus(Integer status) {
        this.hasStatus = Boolean.TRUE;
        this.status = status;
    }

    public Integer getStatus() {
        return status;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.hasGmtCreate = Boolean.TRUE;
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtModify(Date gmtModify) {
        this.hasGmtModify = Boolean.TRUE;
        this.gmtModify = gmtModify;
    }

    public Date getGmtModify() {
        return gmtModify;
    }

    private Boolean hasId;
    private Boolean hasSubject;
    private Boolean hasModel;
    private Boolean hasSourceId;
    private Boolean hasQuestion;
    private Boolean hasAnswer;
    private Boolean hasUrl;
    private Boolean hasExplains;
    private Boolean hasItem1;
    private Boolean hasItem2;
    private Boolean hasItem3;
    private Boolean hasItem4;
    private Boolean hasItem1Flag;
    private Boolean hasItem2Flag;
    private Boolean hasItem3Flag;
    private Boolean hasItem4Flag;
    private Boolean hasStatus;
    private Boolean hasGmtCreate;
    private Boolean hasGmtModify;

    public Boolean hasId(){
        return this.hasId != null;
    }

    public Boolean hasSubject(){
        return this.hasSubject != null;
    }

    public Boolean hasModel(){
        return this.hasModel != null;
    }

    public Boolean hasSourceId(){
        return this.hasSourceId != null;
    }

    public Boolean hasQuestion(){
        return this.hasQuestion != null;
    }

    public Boolean hasAnswer(){
        return this.hasAnswer != null;
    }

    public Boolean hasUrl(){
        return this.hasUrl != null;
    }

    public Boolean hasExplains(){
        return this.hasExplains != null;
    }

    public Boolean hasItem1(){
        return this.hasItem1 != null;
    }

    public Boolean hasItem2(){
        return this.hasItem2 != null;
    }

    public Boolean hasItem3(){
        return this.hasItem3 != null;
    }

    public Boolean hasItem4(){
        return this.hasItem4 != null;
    }

    public Boolean hasItem1Flag(){
        return this.hasItem1Flag != null;
    }

    public Boolean hasItem2Flag(){
        return this.hasItem2Flag != null;
    }

    public Boolean hasItem3Flag(){
        return this.hasItem3Flag != null;
    }

    public Boolean hasItem4Flag(){
        return this.hasItem4Flag != null;
    }

    public Boolean hasStatus(){
        return this.hasStatus != null;
    }

    public Boolean hasGmtCreate(){
        return this.hasGmtCreate != null;
    }

    public Boolean hasGmtModify(){
        return this.hasGmtModify != null;
    }

    public void clearId(){
        this.id = null;
        this.hasId = Boolean.FALSE;
    }

    public void clearSubject(){
        this.subject = null;
        this.hasSubject = Boolean.FALSE;
    }

    public void clearModel(){
        this.model = null;
        this.hasModel = Boolean.FALSE;
    }

    public void clearSourceId(){
        this.sourceId = null;
        this.hasSourceId = Boolean.FALSE;
    }

    public void clearQuestion(){
        this.question = null;
        this.hasQuestion = Boolean.FALSE;
    }

    public void clearAnswer(){
        this.answer = null;
        this.hasAnswer = Boolean.FALSE;
    }

    public void clearUrl(){
        this.url = null;
        this.hasUrl = Boolean.FALSE;
    }

    public void clearExplains(){
        this.explains = null;
        this.hasExplains = Boolean.FALSE;
    }

    public void clearItem1(){
        this.item1 = null;
        this.hasItem1 = Boolean.FALSE;
    }

    public void clearItem2(){
        this.item2 = null;
        this.hasItem2 = Boolean.FALSE;
    }

    public void clearItem3(){
        this.item3 = null;
        this.hasItem3 = Boolean.FALSE;
    }

    public void clearItem4(){
        this.item4 = null;
        this.hasItem4 = Boolean.FALSE;
    }

    public void clearItem1Flag(){
        this.item1Flag = null;
        this.hasItem1Flag = Boolean.FALSE;
    }

    public void clearItem2Flag(){
        this.item2Flag = null;
        this.hasItem2Flag = Boolean.FALSE;
    }

    public void clearItem3Flag(){
        this.item3Flag = null;
        this.hasItem3Flag = Boolean.FALSE;
    }

    public void clearItem4Flag(){
        this.item4Flag = null;
        this.hasItem4Flag = Boolean.FALSE;
    }

    public void clearStatus(){
        this.status = null;
        this.hasStatus = Boolean.FALSE;
    }

    public void clearGmtCreate(){
        this.gmtCreate = null;
        this.hasGmtCreate = Boolean.FALSE;
    }

    public void clearGmtModify(){
        this.gmtModify = null;
        this.hasGmtModify = Boolean.FALSE;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        result = prime * result + ((subject == null) ? 0 : subject.hashCode());
        result = prime * result + ((model == null) ? 0 : model.hashCode());
        result = prime * result + ((sourceId == null) ? 0 : sourceId.hashCode());
        result = prime * result + ((question == null) ? 0 : question.hashCode());
        result = prime * result + ((answer == null) ? 0 : answer.hashCode());
        result = prime * result + ((url == null) ? 0 : url.hashCode());
        result = prime * result + ((explains == null) ? 0 : explains.hashCode());
        result = prime * result + ((item1 == null) ? 0 : item1.hashCode());
        result = prime * result + ((item2 == null) ? 0 : item2.hashCode());
        result = prime * result + ((item3 == null) ? 0 : item3.hashCode());
        result = prime * result + ((item4 == null) ? 0 : item4.hashCode());
        result = prime * result + ((item1Flag == null) ? 0 : item1Flag.hashCode());
        result = prime * result + ((item2Flag == null) ? 0 : item2Flag.hashCode());
        result = prime * result + ((item3Flag == null) ? 0 : item3Flag.hashCode());
        result = prime * result + ((item4Flag == null) ? 0 : item4Flag.hashCode());
        result = prime * result + ((status == null) ? 0 : status.hashCode());
        result = prime * result + ((gmtCreate == null) ? 0 : gmtCreate.hashCode());
        result = prime * result + ((gmtModify == null) ? 0 : gmtModify.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        DriveSubjectDo other = (DriveSubjectDo) obj;
        if (id == null) {
            if(other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (subject == null) {
            if(other.subject != null)
                return false;
        } else if (!subject.equals(other.subject))
            return false;
        if (model == null) {
            if(other.model != null)
                return false;
        } else if (!model.equals(other.model))
            return false;
        if (sourceId == null) {
            if(other.sourceId != null)
                return false;
        } else if (!sourceId.equals(other.sourceId))
            return false;
        if (question == null) {
            if(other.question != null)
                return false;
        } else if (!question.equals(other.question))
            return false;
        if (answer == null) {
            if(other.answer != null)
                return false;
        } else if (!answer.equals(other.answer))
            return false;
        if (url == null) {
            if(other.url != null)
                return false;
        } else if (!url.equals(other.url))
            return false;
        if (explains == null) {
            if(other.explains != null)
                return false;
        } else if (!explains.equals(other.explains))
            return false;
        if (item1 == null) {
            if(other.item1 != null)
                return false;
        } else if (!item1.equals(other.item1))
            return false;
        if (item2 == null) {
            if(other.item2 != null)
                return false;
        } else if (!item2.equals(other.item2))
            return false;
        if (item3 == null) {
            if(other.item3 != null)
                return false;
        } else if (!item3.equals(other.item3))
            return false;
        if (item4 == null) {
            if(other.item4 != null)
                return false;
        } else if (!item4.equals(other.item4))
            return false;
        if (item1Flag == null) {
            if(other.item1Flag != null)
                return false;
        } else if (!item1Flag.equals(other.item1Flag))
            return false;
        if (item2Flag == null) {
            if(other.item2Flag != null)
                return false;
        } else if (!item2Flag.equals(other.item2Flag))
            return false;
        if (item3Flag == null) {
            if(other.item3Flag != null)
                return false;
        } else if (!item3Flag.equals(other.item3Flag))
            return false;
        if (item4Flag == null) {
            if(other.item4Flag != null)
                return false;
        } else if (!item4Flag.equals(other.item4Flag))
            return false;
        if (status == null) {
            if(other.status != null)
                return false;
        } else if (!status.equals(other.status))
            return false;
        if (gmtCreate == null) {
            if(other.gmtCreate != null)
                return false;
        } else if (!gmtCreate.equals(other.gmtCreate))
            return false;
        if (gmtModify == null) {
            if(other.gmtModify != null)
                return false;
        } else if (!gmtModify.equals(other.gmtModify))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "DriveSubjectDo[id=" + id + ", subject=" + subject + ", model=" + model + ", sourceId=" + sourceId + ", question=" + question + ", answer=" + answer + ", url=" + url + ", explains=" + explains + ", item1=" + item1 + ", item2=" + item2 + ", item3=" + item3 + ", item4=" + item4 + ", item1Flag=" + item1Flag + ", item2Flag=" + item2Flag + ", item3Flag=" + item3Flag + ", item4Flag=" + item4Flag + ", status=" + status + ", gmtCreate=" + gmtCreate + ", gmtModify=" + gmtModify + ", hasId=" + hasId + ", hasSubject=" + hasSubject + ", hasModel=" + hasModel + ", hasSourceId=" + hasSourceId + ", hasQuestion=" + hasQuestion + ", hasAnswer=" + hasAnswer + ", hasUrl=" + hasUrl + ", hasExplains=" + hasExplains + ", hasItem1=" + hasItem1 + ", hasItem2=" + hasItem2 + ", hasItem3=" + hasItem3 + ", hasItem4=" + hasItem4 + ", hasItem1Flag=" + hasItem1Flag + ", hasItem2Flag=" + hasItem2Flag + ", hasItem3Flag=" + hasItem3Flag + ", hasItem4Flag=" + hasItem4Flag + ", hasStatus=" + hasStatus + ", hasGmtCreate=" + hasGmtCreate + ", hasGmtModify=" + hasGmtModify+ "]";
    }
}
