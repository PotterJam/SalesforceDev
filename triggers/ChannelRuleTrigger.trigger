trigger ChannelRuleTrigger on Channel_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelRuleHandler.handleAfterDelete(Trigger.old);
    }
}
