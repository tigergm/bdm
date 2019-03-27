---
title: "Other services"
date: 2019-03-13T18:28:09-07:00
draft: false
weight: 5
---

## Data Catalog

In the `[metadata]` section, Hue is supporting Cloudera Navigator and soon Apache Atlas ([HUE-8749](https://issues.cloudera.org/browse/HUE-8749)) in order to enrich the [data catalog](/user/browsers/).


## Query Optimization

In the `[metadata]` section, Hue is supporting Cloudera Navigator Optimiser and soon other services. The goal is to provide recommendation on how to write better queries and get risk alerts on dangerous operations directly within the [editor](/user/editor/).

## YARN Cluster

Hue supports one or two Yarn clusters (two for HA). These clusters should be defined
under the `[[[default]]]` and `[[[ha]]]` sub-sections.

    # Configuration for YARN (MR2)
    # ------------------------------------------------------------------------
    [[yarn_clusters]]

      [[[default]]]

        resourcemanager_host=yarn-rm.com
        resourcemanager_api_url=http://yarn-rm.com:8088/
        proxy_api_url=http://yarn-proxy.com:8088/
        resourcemanager_port=8032
        history_server_api_url=http://yarn-rhs-com:19888/


## Spark

The `[spark]` section details how to point to [Livy](https://livy.incubator.apache.org/) in order to execute interactive Spark snippets in Scala or Python.

    [spark]
      # Host address of the Livy Server.
      ## livy_server_host=localhost

      # Port of the Livy Server.
      ## livy_server_port=8998

## Kafka

The configuration is in `[kafka]` but the service is still experiemental.


## Solr Search

In the `[search]` section of the configuration file, you should
specify:

    [search]
      # URL of the Solr Server
      solr_url=http://solr-server.com:8983/solr/

## Oozie

In the `[liboozie]` section of the configuration file, you should
specify:

    [liboozie]
      oozie_url=http://oozie-server.com:11000/oozie

Make sure that the [Share Lib](https://oozie.apache.org/docs/5.1.0/DG_QuickStart.html#Oozie_Share_Lib_Installation) is installed.

To configure Hue as a default proxy user, add the following properties to /etc/oozie/conf/oozie-site.xml:

    <!-- Default proxyuser configuration for Hue -->
    <property>
        <name>oozie.service.ProxyUserService.proxyuser.hue.hosts</name>
        <value>*</value>
    </property>
    <property>
        <name>oozie.service.ProxyUserService.proxyuser.hue.groups</name>
        <value>*</value>
    </property>

## HBase

Specify the HBase Thrift Server1 in Hue:

    [hbase]
    hbase_clusters=(Cluster|localhost:9090)

HBase Impersonation:

Enable impersonation for the Thrift server by adding the following properties to hbase-site.xml on each Thrift gateway:

    <property>
      <name>hbase.regionserver.thrift.http</name>
      <value>true</value>
    </property>
    <property>
      <name>hbase.thrift.support.proxyuser</name>
      <value>true/value>
    </property>

Note: If you use framed transport, you cannot use doAs impersonation, because SASL does not work with Thrift framed transport.

doAs Impersonation provides a flexible way to use the same client to impersonate multiple principals. doAs is supported only in Thrift 1.
Enable doAs support by adding the following properties to hbase-site.xml on each Thrift gateway:

    <property>
      <name>hbase.regionserver.thrift.http</name>
      <value>true</value>
    </property>
    <property>
      <name>hbase.thrift.support.proxyuser</name>
      <value>true/value>
    </property>
