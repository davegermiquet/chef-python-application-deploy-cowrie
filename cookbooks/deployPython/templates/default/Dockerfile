FROM python
MAINTAINER davegermiquet@trulycanadian.net
COPY <%= node[:default][:directory][:git] %>/  <%= node[:default][:directory][:external] %>
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y python-pip python-dev libgmp3-dev libmpfr-dev libmpc-dev virtualenv
RUN useradd -ms /bin/bash <%= node[:default][:user_to_add] %>
RUN chown -R <%= node[:default][:user_to_add] %> /home/<%= node[:default][:user_to_add] %>
RUN chown -R <%= node[:default][:user_to_add] %> <%=node[:default][:directory][:external] %>

<% if node[:default][:customscript] -%>

COPY <%= node[:default][:customscript] %>  <%= node[:default][:directory][:external] %>
RUN chmod +x <%= node[:default][:directory][:external]%>/<%=node[:default][:customscript]%>

<%end -%>

<% if node[:default][:directory][:virtualenv27] -%>

RUN mkdir -p <%= node[:default][:directory][:virtualenv27] %>
RUN chown -R <%= node[:default][:user_to_add]%> <%=node[:default][:directory][:virtualenv27] %>
USER <%=node[:default][:user_to_add] %> 
RUN virtualenv -p /usr/bin/python2.7 <%= node[:default][:directory][:virtualenv27] %>

<% end -%>
<% if node[:default][:directory][:virtualenv36] -%>

RUN mkdir -p <%= node[:default][:directory][:virtualenv36] %>

USER <%=node[:default][:user_to_add] %> 
RUN chown -R <%= node[:default][:user_to_add]%> <%=node[:default][:directory][:virtualenv36] %>
RUN virtualenv -p /usr/bin/python3.6 <%= node[:default][directory][:virtualenv36] %>
<% end -%>

<% if node[:default][:customscript] -%>

RUN bash -c <%= node[:default][:directory][:external] %>/<%= node[:default][:customscript] %>

<% end -%>

EXPOSE 2222
