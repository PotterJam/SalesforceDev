trigger ChannelPolicyTrigger on Channel_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
