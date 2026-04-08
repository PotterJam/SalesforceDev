trigger ChannelModelTrigger on Channel_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelModelHandler.handleAfterDelete(Trigger.old);
    }
}
