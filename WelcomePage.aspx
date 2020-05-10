<%@ Page Title="" Language="C#" MasterPageFile="~/_MainLayout.master" AutoEventWireup="true" CodeFile="WelcomePage.aspx.cs" Inherits="WelcomePage" %>
<%@ MasterType VirtualPath="~/_MainLayout.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Online Examination System | Online Exam Software | Online Exam  Free |  E-exam</title>
    <link href="Style/CSSstyle.css" rel="stylesheet" />       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="well center-block">
       <h1 class="text-center">Welcome in E-exam</h1>
    </div>
    <div class="FirstPara">
        <p>
           <q>Definition</q><br />
                E-exams fall into the category of eAssessment, where students demonstrate academic achievement using computers.
             Within this broad spectrum, eExams form a distinct use of technology where a 'bring your own device' (BYOD) 
            computer is started up (booted) from a USB flash drive. Because each computer is booted from a USB flash drive, 
            every candidate uses the same full operating system and application programs, irrespective of those installed 
            on the internal hard drive. eExams optionally include networking connections, but these are usually restricted or 
            eliminated to prevent collusion. Unlike most online quiz tools, the eExam is not restricted to a web-page, 
            but makes the whole candidate computer available for the assessment. eExams are seen as having potential for 
            curriculum transformation by changing the nature of assessment to fully incorporate computer technology. 
            Autosave is a common feature of eExams, with intervals from 10 seconds to every 2 minutes. Some emerging models 
            have been released into the public domain, and others are proprietary commercial material (with costs).
        </p>
    </div>
    <br />
    <div class="SecondPara">
<p>
    <q>Emerging models</q>
    <br />
eExam System: the first use of any eExam. for the award of a degree was in November 2009 at the University of Tasmania.
   It was subsequently adopted for university entrance examinations by the Tasmanian Qualifications Authority in 2011.
     In 2016 the eExam system became the subject of a national project in Australian universities.
     Security methods limit access to the eExam USB flash drive, prevent use of all communication channels,
     and require a unique desktop security image photograph for every sitting. The source code is available under
     open source GPL licences.
CQUniversity Australia - eExam trial at the School of Engineering and Technology: A commercial product,
     Exam Pro software, was used in a supervised e-exam consisting of short answer and essay-type questions.
Abitti: the mission of the Abitti project is to transform all university entrance assessments in Finland to eExams 
    by 2020.The source code is available under a GPLv3 license.
RU exam system: this uses a Linux-based bootable USB exam system for students' laptops at Reykjavik University
Secure-Exam-Environment: from Alpen-Adria-Universit Klagenfurt uses Moodle on a Knoppix-flavoured Linux distribution
</p>
    </div>
    <br />

    <div class="ThirdPara">
        <p>
            <q>Similar systems</q><br />
Each of these similar systems offers a basic word processor and multiple choice question functionality outside a web-page.
Examsoft SofTest requires each candidate to install proprietary software on their own computer and use it before the exam 
to download an encrypted question paper. This is unlocked during the exam, revealing multiple choice and essay-style 
questions to which the candidate responds. After the fixed time period of the exam, candidates leave the venue and connect
within a short time to an Examsoft web-site to upload the encrypted answerscript.
Exam4 This product is marketed as a secured word processing environment for high-stakes essay exams. Candidates install the 
software and respond to essay-style and/or multiple choice questions. The software can be set to block access to the internet
and local hard drives. At the end of the exam, candidate responses are uploaded to a server for decryption and marking.
        </p>
    </div>
    <br />

    <div class="ForthPara">
        <p>
            <q>Benefits</q>
            <br />
Electronic exams offer benefits such as ease of marking, reduced need to read illegible handwriting,
             saving of time and raw materials and reduced logistical overheads.
        </p>
    </div>
    <br />

    <div class="FifthPara">
        <p>
            <q>Challenges</q>
            <br />
Many innovations face reactionary challenges in the social, political and technical spheres.
Objections focus on the unreliability of computer equipment or the potential for cheating.
Some 'hacks' against eExams use cooling of the computer RAM to 0 degrees Celsius, when the contents can be preserved 
for about 45 seconds. This is irrelevant if the exam question paper is published after the assessment and open source 
software is used (since the material is put in the public domain anyway). These criticisms have been answered by a risk 
tree comparison with paper-based examinations, finding the typing and handwriting in examinations are similarly secure.
The challenges of e-exams are: usability issues during the exam, increased stress level due to unfamiliarity with 
e-exam systems and inadequate functionality.
        </p>
    </div>
    <br />

    <div class="SixPara">
        <p>
            <q>The stages of the e-Exam</q>
            <br />
1.The teacher adds the questions and basic exam data in the eExam application.<br />
2.The student signs up for the exam in the eExam application.<br />
3.The student receives a confirmation e-mail about the booking.  <br />
4.The student completes the exam in the eExam room.<br />
5.The teacher receives an e-mail notification of a submitted exam.<br />
6.The teacher evaluates and grades the exam. NB! The teacher takes the result to the study register.<br />
7.The student receives an e-mail notification that the exam has been evaluated. <br />
8.The student can sign in to eExam to see the grade and the feedback.<br />

        </p>
    </div>
     <br />

     <div class="well center-block">
       <h3 class="text-center">“ Now you can join us by Registering as : ”</h3>
    </div>
    <br />

    <div class="WrapImg center-block">
        <div class="ImgStudent"><asp:ImageButton ID="ImgBtnStudent" runat="server" ImageUrl="~/ico/student.png" Width="200px" CssClass="StudImg" PostBackUrl="~/Registration.aspx" TabIndex="1" ToolTip="student" />
          <br />  <asp:Label ID="Label1" runat="server" Text="Student" Font-Names="Candara" Font-Size="X-Large" ForeColor="#3D2F46"></asp:Label>
        </div>        <a href="#goto" id="goto"></a>
        <div class="ImgProf"><asp:ImageButton ID="ImgBtnProf" runat="server" ImageUrl="~/ico/prof.png" Width="200px" CssClass="profImg" PostBackUrl="~/ProfRegistration.aspx" TabIndex="2" ToolTip="Professor" />
             <br />  <asp:Label ID="Label2" runat="server" Text="professor" Font-Names="Candara" Font-Size="X-Large" ForeColor="#3D2F46"></asp:Label>
        </div>
    </div>
</asp:Content>

