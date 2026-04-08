trigger ChannelRegistryTrigger on Channel_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
