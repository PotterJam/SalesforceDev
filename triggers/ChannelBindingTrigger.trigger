trigger ChannelBindingTrigger on Channel_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelBindingHandler.handleAfterDelete(Trigger.old);
    }
}
