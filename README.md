request-tracker Cookbook
========================
Install request-tracker using the system package

e.g.
This cookbook makes your favorite breakfast sandwich.

Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

Plataforms:
 - Debian
 - Ubuntu

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### request-tracker::default
<table>
  <tr>
    <th>Attribute</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>node['request-tracker']['server']</tt></td>
    <td>Support 'apache' and 'nginx'</td>
    <td><tt>nginx</tt></td>
  </tr>
  <tr>
    <td><tt>node['request-tracker']['domain']</tt></td>
    <td></td>
    <td><tt>''</tt></td>
  </tr>
  <tr>
    <td><tt>node['request-tracker']['service_name']</tt></td>
    <td>The filename of the service to be installed</td>
    <td><tt>request-tracker</tt></td>
  </tr>
  <tr>
    <td><tt>node['request-tracker']['fcgi_workers']</tt></td>
    <td>The number of fcgi workers (nginx server)</td>
    <td><tt>1</tt></td>
  </tr>
  <tr>
    <td><tt>node['request-tracker']['name']</tt></td>
    <td>Site name</td>
    <td><tt>Request Tracker</tt></td>
  </tr>
  <tr>
    <td><tt>node['request-tracker']['organization']</tt></td>
    <td>Site name</td>
    <td><tt>Request Tracker</tt></td>
  </tr>
  <tr>
    <td><tt>node['request-tracker']['force_language']</tt></td>
    <td>Force a specifig language</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>node['request-tracker']['correspond_addess']</tt></td>
    <td>Correspond email</td>
    <td><tt>''</tt></td>
  </tr>
  <tr>
    <td><tt>node['request-tracker']['comment_addess']</tt></td>
    <td>Comment email</td>
    <td><tt>''</tt></td>
  </tr>
  <tr>
    <td><tt>node['request-tracker']['web_path']</tt></td>
    <td>Web path</td>
    <td><tt>'/rt'</tt></td>
  </tr>
  <tr>
    <td><tt>node['request-tracker']['web_url']</tt></td>
    <td>Web URL</td>
    <td><tt>http://#{node['request-tracker']['domain']}</tt></td>
  </tr>
  <tr>
    <td><tt>node['request-tracker']['db_type']</tt></td>
    <td>What DB (mysql, Pg, SQLite, ...)</td>
    <td><tt>mysql</tt></td>
  </tr>
  <tr>
    <td><tt>node['request-tracker']['db_host']</tt></td>
    <td>DB host</td>
    <td><tt>localhost</tt></td>
  </tr>
  <tr>
    <td><tt>node['request-tracker']['db_port']</tt></td>
    <td>DB port</td>
    <td><tt>''</tt></td>
  </tr>
  <tr>
    <td><tt>node['request-tracker']['db_name']</tt></td>
    <td>DB name</td>
    <td><tt>'rt'</tt></td>
  </tr>
  <tr>
    <td><tt>node['request-tracker']['db_user']</tt></td>
    <td>DB user</td>
    <td><tt>'rtuser'</tt></td>
  </tr>
  <tr>
    <td><tt>node['request-tracker']['db_password']</tt></td>
    <td>DB password</td>
    <td><tt>''</tt></td>
  </tr>
</table>

Usage
-----
#### request-tracker::default
Just include `request-tracker` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[request-tracker]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

