trigger ChannelProxyTrigger on Channel_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelProxyHandler.handleAfterDelete(Trigger.old);
    }
}
