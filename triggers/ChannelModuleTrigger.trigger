trigger ChannelModuleTrigger on Channel_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelModuleHandler.handleAfterDelete(Trigger.old);
    }
}
