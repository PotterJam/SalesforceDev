trigger ReferralConnectorTrigger on Referral_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
