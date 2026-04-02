trigger DeliverableRuleTrigger on Deliverable_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableRuleHandler.handleAfterDelete(Trigger.old);
    }
}
