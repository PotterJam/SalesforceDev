trigger ScoreLinkTrigger on Score_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreLinkHandler.handleAfterDelete(Trigger.old);
    }
}
