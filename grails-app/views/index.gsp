
<html>
    <head>
        <title>Team Amish's Group Management Tool</title>
        <meta name="layout" content="main" />
        <style type="text/css" media="screen">

        #nav {
            margin-top:20px;
            margin-left:30px;
            width:228px;
            float:left;

        }
        .homePagePanel * {
            margin:0px;
        }
        .homePagePanel .panelBody ul {
            list-style-type:none;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody h1 {
            text-transform:uppercase;
            font-size:1.1em;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody {
            background: url(images/leftnav_midstretch.png) repeat-y top;
            margin:0px;
            padding:15px;
        }
        .homePagePanel .panelBtm {
            background: url(images/leftnav_btm.png) no-repeat top;
            height:20px;
            margin:0px;
        }

        .homePagePanel .panelTop {
            background: url(images/leftnav_top.png) no-repeat top;
            height:11px;
            margin:0px;
        }
        h2 {
            margin-top:15px;
            margin-bottom:15px;
            font-size:1.2em;
        }
        #pageBody {
            margin-left:280px;
            margin-right:20px;
        }
        </style>
    </head>
    <body>
        <div id="nav">
            <div class="homePagePanel">
                <div class="panelTop"></div>
                <div class="panelBody">
                   <h2>Site Map:</h2>
                   <br></br>
                <ul>
					<li class="controller"><g:link controller="manager">Managers</g:link></li>
					<li class="controller"><g:link controller="course">Courses</g:link></li>
					<li class="controller"><g:link controller="project">Projects</g:link></li>
					<li class="controller"><g:link controller="team">Teams</g:link></li>
					<li class="controller"><g:link controller="survey">Surveys</g:link></li>
					<li class="controller"><g:link controller="student">Students</g:link></li>
                </ul>
                </div>
                <div class="panelBtm"></div>
            </div>
        </div>
        <div id="pageBody">
            <h1>Welcome to Team Amish's Group Management Tool!</h1>
            <br></br>
            <p>This is a group management tool that supports the efficient incorporation of survey data in the group 
            management process.
            <br></br> 
            Unlike Google Survey Tool or paper alternatives, our project specifically supports
            group projects in a course setting.</p>
			
			<br></br>
			
			<h3>Benefits:</h3>
			<br></br>
				<ul>
					<li>Creates cohesive, dynamic groups that lead to effective outcomes.</li>
					<li>Empowers students and teachers to give and get meaningful feedback.</li>
					<li>It's convenient!</li>
					<li>Improves student performance and experience.</li>
				</ul>
			
            <div id="controllerList" class="dialog">
                <h2>Available Controllers:</h2>
                <ul>
                    
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                    </g:each>
                </ul>
            </div>
        </div>
    </body>
</html>
