<?php

namespace CustomBundle\Biz\SectionGoal\Job;

use AppBundle\Common\ArrayToolkit;
use Biz\Crontab\Service\Job;
use CustomBundle\Biz\Mail\Template\EmailConfirmWarnTemplate;
use CustomBundle\Biz\PhpMailer\Mail;

class OtherRatedJob extends BaseJob implements Job
{
    public function execute($params)
    {
        $userOtherRateds = $this->getOthersRatingService()->findAllNotOtherRatedBySectionGoalId($params['id']);

        if ($params['beforeDays'] == 'one') {
            foreach ($userOtherRateds as $userOtherRated) {
                $user = $this->getUserService()->getUser($userOtherRated['inviteId']);
                $result = $this->getUserService()->getUser($userOtherRated['userId']);
                $params['username'] = $result['nickname'];
                $orgIds = explode('.', $user['orgCode']);
                array_pop($orgIds);
                $managers = $this->getOrgManagers($orgIds);
                $this->sendMail($user, $params, $managers);
            }
        } elseif ($params['beforeDays'] == 'three') {
            foreach ($userOtherRateds as $userOtherRated) {
                $user = $this->getUserService()->getUser($userOtherRated['inviteId']);
                $result = $this->getUserService()->getUser($userOtherRated['userId']);
                $params['username'] = $result['nickname'];
                $org = $this->getOrgService()->getOrg($user['orgId']);
                $ids = explode('.', $org['managerIds']);
                $managers = $this->getUserService()->findUsersByIds($ids);
                $this->sendMail($user, $params, $managers);
            }
        } elseif ($params['beforeDays'] == 'seven') {
            foreach ($userOtherRateds as $userOtherRated) {
                $user = $this->getUserService()->getUser($userOtherRated['inviteId']);
                $result = $this->getUserService()->getUser($userOtherRated['userId']);
                $params['username'] = $result['nickname'];
                $this->sendMail($user, $params);
            }
        }
    }

    private function sendMail($user, $params, $managers = array())
    {
        $fields = array(
            'nickname' => $user['nickname'],
            'sectionGoal' => $params['name'],
            'url' => '',
            'username' => $params['username']
        );
        $template = new EmailConfirmWarnTemplate();
        $template = $template->parse($fields);
        (new Mail())->sendMail(array(
            'to' => $user['email'],
            'CcPerson' => empty($managers) ? '' : ArrayToolkit::column($managers, 'mail'),
            'template' => $template
        ));
    }

    private function getOrgManagers($orgIds)
    {
        $org = $this->getOrgService()->findOrgsByIds($orgIds);
        $orgManagers = ArrayToolkit::column($org, 'managers');
        $managers = array();
        foreach ($orgManagers as $orgManager) {
            $ids = explode('.', $orgManager['managerIds']);

            $managers = array_merge($managers, $this->getUserService()->findUsersByIds($ids));
        }

        return $managers;
    }

    protected function getOthersRatingService()
    {
        return $this->createService('CustomBundle:OthersRating:OthersRatingService');
    }

    protected function getUserService()
    {
        return $this->createService('User:UserService');
    }

    protected function getOrgService()
    {
        return $this->createService('Org:OrgService');
    }
}